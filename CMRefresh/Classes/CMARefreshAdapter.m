//
//  CMARefreshAdapter.m
//  Pods
//
//  Created by on 2017/8/13.
//
//

#import "CMARefreshAdapter.h"

@interface CMARefreshAdapter ()

@end

@implementation CMARefreshAdapter

+ (instancetype)adapterWithScrollView:(UIScrollView *)scrollView
                          refreshType:(CMARefreshType)refreshType{
    return [[self alloc] initWithScrollView:scrollView refreshType:refreshType];
}

- (instancetype)initWithScrollView:(UIScrollView *)scrollView
                       refreshType:(CMARefreshType)refreshType{
    self = [super init];
    if (self) {
        _scrollView                 = scrollView;
        _refreshType                = refreshType;
        [self reloadAdapter];
    }
    return self;
}

#pragma mark - 添加刷新控件
- (void)addRefreshHeader{
    [self removeRefreshHeader];
    
    MJRefreshStateHeader *header;
    if ([self.adapterDatasouce respondsToSelector:@selector(refreshHeaderOfClass)]) {
        Class headerClass = [self.adapterDatasouce refreshHeaderOfClass];
        if ([headerClass isKindOfClass:[MJRefreshStateHeader class]]) {
            header = [headerClass headerWithRefreshingTarget:self refreshingAction:@selector(pullDownToRefresh)];
        }
    }
    if (!header) {
        header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullDownToRefresh)];
    }
    
    self.scrollView.mj_header = header;
}

- (void)addRefreshFooter{
    [self removeRefreshfooter];
    
    MJRefreshFooter *footer;
    if ([self.adapterDatasouce respondsToSelector:@selector(refreshFooterOfClass)]) {
        Class footerClass = [self.adapterDatasouce refreshFooterOfClass];
        id footerObject = [[footerClass alloc] init];
        if ([footerObject isKindOfClass:[MJRefreshFooter class]]) {
            footer = [footerClass footerWithRefreshingTarget:self refreshingAction:@selector(pullUpToLoadMore)];
        }
    }
    if (!footer) {
        footer = [MJRefreshBackFooter footerWithRefreshingTarget:self refreshingAction:@selector(pullUpToLoadMore)];
    }
    
    self.scrollView.mj_footer = footer;
}

#pragma mark - 移除刷新控件
- (void)removeRefreshHeader{
    if (self.refreshHeader.isRefreshing) {
        [self.refreshHeader endRefreshing];
        self.scrollView.mj_header = nil;
    }
}

- (void)removeRefreshfooter{
    if (self.refreshFooter) {
        if (self.scrollView.mj_footer.isRefreshing) {
            [self.scrollView.mj_footer endRefreshing];
        }
        self.scrollView.mj_footer = nil;
    }
}

#pragma mark - 重新设置
- (void)reloadAdapter{
    [self removeRefreshHeader];
    [self removeRefreshfooter];
    
    switch (self.refreshType) {
        case CMARefreshTypeAll:
            [self addRefreshHeader];
            [self addRefreshFooter];
            break;
        case CMARefreshTypePullDown:
            [self addRefreshHeader];
            break;
        case CMARefreshTypePullUp:
            [self addRefreshFooter];
            break;
        default:
            break;
    }
}

#pragma mark - 内部方法-上拉下拉
- (void)pullDownToRefresh{
    if (self.refreshFooter.isRefreshing) {
        
        if ([self.adapterDelegate respondsToSelector:@selector(refreshAdapter:willChancelRefreshFooter:)]) {
            [self.adapterDelegate refreshAdapter:self willChancelRefreshFooter:self.refreshFooter];
        }
        
        [self.refreshFooter endRefreshing];
        
        if ([self.adapterDelegate respondsToSelector:@selector(refreshAdapter:didChancelRefreshFooter:)]) {
            [self.adapterDelegate refreshAdapter:self didChancelRefreshFooter:self.refreshFooter];
        }
    }
    
    if ([self.adapterDelegate respondsToSelector:@selector(refreshAdapter:didStartRefreshHeader:)]) {
        [self.adapterDelegate refreshAdapter:self didStartRefreshHeader:self.refreshHeader];
    }
}

- (void)pullUpToLoadMore{
    if (self.refreshHeader.isRefreshing) {
        
        if ([self.adapterDelegate respondsToSelector:@selector(refreshAdapter:willCancelRefreshHeader:)]) {
            [self.adapterDelegate refreshAdapter:self willCancelRefreshHeader:self.refreshHeader];
        }
        
        [self.refreshHeader endRefreshing];
        
        if ([self.adapterDelegate respondsToSelector:@selector(refreshAdapter:didCancelRefreshHeader:)]) {
            [self.adapterDelegate refreshAdapter:self didCancelRefreshHeader:self.refreshHeader];
        }
    }
    
    if ([self.adapterDelegate respondsToSelector:@selector(refreshAdapter:didStartRefreshFooter:)]) {
        [self.adapterDelegate refreshAdapter:self didStartRefreshFooter:self.refreshFooter];
    }
}

#pragma mark - 外部方法-上拉下拉
- (void)beginRefreshingHeader{
    if (self.refreshType == CMARefreshTypePullDown || self.refreshHeader.isRefreshing) {
        return;
    }
    
    [self.refreshHeader beginRefreshing];
}

- (void)beginRefreshingFooter{
    if (self.refreshType == CMARefreshTypePullUp || self.refreshFooter.isRefreshing) {
        return;
    }
    
    [self.refreshFooter beginRefreshing];
}

- (void)endRefreshing{
    
    if (self.refreshHeader.isRefreshing) {
        [self.refreshHeader endRefreshing];
        
//        if (self.refreshType == RefreshTypePullUp) {
//            return;
//        }
        
        if ([self.adapterDelegate respondsToSelector:@selector(refreshAdapter:footerShouldEndRefreshingWithNoMoreData:)]) {
            
            BOOL noMoreData = [self.adapterDelegate refreshAdapter:self footerShouldEndRefreshingWithNoMoreData:self.refreshFooter];
            if (noMoreData) {
                [self.refreshFooter endRefreshingWithNoMoreData];
            }else{
                [self.refreshFooter resetNoMoreData];
            }
        }
    }
    
    if (self.refreshFooter.isRefreshing) {
        
        if ([self.adapterDelegate respondsToSelector:@selector(refreshAdapter:footerShouldEndRefreshingWithNoMoreData:)]) {
            
            BOOL noMoreData = [self.adapterDelegate refreshAdapter:self footerShouldEndRefreshingWithNoMoreData:self.refreshFooter];
            if (noMoreData) {
                [self.refreshFooter endRefreshingWithNoMoreData];
                return;
            }
        }
        
        [self.refreshFooter endRefreshing];
    }
}

#pragma mark - Setter && Getter
- (MJRefreshHeader *)refreshHeader{
    return self.scrollView.mj_header;
}

- (MJRefreshFooter *)refreshFooter{
    return self.scrollView.mj_footer;
}
    
- (NSInteger)totalDataCount{
    return self.scrollView.mj_totalDataCount;
}

- (void)setAdapterDatasouce:(id<CMARefreshAdapterDatasouce>)adapterDatasouce{
    _adapterDatasouce = adapterDatasouce;
    [self reloadAdapter];
}

@end
