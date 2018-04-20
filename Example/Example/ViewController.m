//
//  ViewController.m
//  Example
//
//  Created by maitianer on 2018/4/20.
//

#import "ViewController.h"
#import <CMARefresh/CMARefreshAdapter.h>

@interface ViewController ()<CMARefreshAdapterDelegate,CMARefreshAdapterDatasouce>

@property (nonatomic, strong) UITableView *tableview;

@property (nonatomic, strong) CMARefreshAdapter *refreshAdapter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CMARefreshAdapterDelegate
/**是否显示NoMoreData*/
- (BOOL)refreshAdapter:(CMARefreshAdapter *)adapter footerShouldEndRefreshingWithNoMoreData:(MJRefreshFooter *)footer
{
    return YES;
}
/**头视图开始刷新时*/
- (void)refreshAdapter:(CMARefreshAdapter *)adapter didStartRefreshHeader:(MJRefreshHeader *)header
{
    
}
/**当头部在刷新时开始上拉加载，会停止下拉刷新动画，以下方法同用法*/
- (void)refreshAdapter:(CMARefreshAdapter *)adapter willCancelRefreshHeader:(MJRefreshHeader *)header
{
    
}

- (void)refreshAdapter:(CMARefreshAdapter *)adapter didCancelRefreshHeader:(MJRefreshHeader *)header
{
    
}

- (void)refreshAdapter:(CMARefreshAdapter *)adapter didStartRefreshFooter:(MJRefreshFooter *)footer
{
    
}

- (void)refreshAdapter:(CMARefreshAdapter *)adapter willChancelRefreshFooter:(MJRefreshFooter *)foote
{
    
}

- (void)refreshAdapter:(CMARefreshAdapter *)adapter didChancelRefreshFooter:(MJRefreshFooter *)footer
{
    
}

#pragma mark - CMARefreshAdapterDatasouce
/**定制头视图*/
- (Class)refreshHeaderOfClass
{
    return [MJRefreshHeader class];
}
/**定制尾视图*/
- (Class)refreshFooterOfClass
{
    return [MJRefreshFooter class];
}

#pragma mark - lazyload
- (UITableView *)tableview {
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    }
    return _tableview;
}

- (CMARefreshAdapter *)refreshAdapter {
    if (!_refreshAdapter) {
        _refreshAdapter = [CMARefreshAdapter adapterWithScrollView:self.tableview refreshType:CMARefreshTypeAll];
        _refreshAdapter.adapterDelegate = self;
        _refreshAdapter.adapterDatasouce = self;
    }
    return _refreshAdapter;
}

@end
