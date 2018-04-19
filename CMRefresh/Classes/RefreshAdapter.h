//
//  RefreshAdapter.h
//  Pods
//
//  Created by on 2017/8/13.
//
//

#import <Foundation/Foundation.h>
#import <MJRefresh/MJRefresh.h>
#import "RefreshAdapterDelegate.h"
#import "RefreshAdapterDatasouce.h"

typedef NS_ENUM(NSInteger, RefreshType) {
    RefreshTypeAll      = 0, /** 同时支持下拉刷新和上拉加载更多 */
    RefreshTypePullDown = 1, /** 只支持下拉刷新 */
    RefreshTypePullUp   = 2, /** 只支持上拉加载更多 */
};

@interface RefreshAdapter : NSObject

/**
 需要添加上拉下拉空间的视图
 */
@property (weak  , nonatomic, readonly ) UIScrollView     *scrollView;

/**
 是否在刷新,下拉上拉都没有处于在刷新的状态才返回NO
 */
@property (assign, nonatomic, readonly ) BOOL             isRefreshing;

/**
 头部的刷新控件
 */
@property (weak  , nonatomic, readonly ) MJRefreshHeader  *refreshHeader;

/**
 底部的刷新控件
 */
@property (weak  , nonatomic, readonly ) MJRefreshFooter  *refreshFooter;

/**
 刷新的类型
 */
@property (assign, nonatomic, readonly ) RefreshType      refreshType;

/**
 总的数据量
 */
@property (assign, nonatomic, readonly ) NSInteger        totalDataCount;

/**
 代理者，可监控刷新控件的生命周期
 */
@property (weak  , nonatomic, readwrite) id <RefreshAdapterDelegate>  adapterDelegate;

/**
 数据源，可定制头部或底部的刷新控件
 */
@property (weak  , nonatomic, readwrite) id <RefreshAdapterDatasouce> adapterDatasouce;

/**
 初始化

 @param scrollView 需要添加上拉下拉空间的视图
 @param refreshType 刷新的类型
 @return 返回实例
 */
+ (instancetype)adapterWithScrollView:(UIScrollView *)scrollView
                          refreshType:(RefreshType)refreshType;

/**
 重新配置实例
 */
- (void)reloadAdapter;

/**
 开始下拉刷新
 */
- (void)beginRefreshingHeader;

/**
 开始上拉加载更多
 */
- (void)beginRefreshingFooter;

/**
 停止刷新状态
 */
- (void)endRefreshing;

@end
