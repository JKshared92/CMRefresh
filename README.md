# CMRefresh

对MJRefesh二次封装

因为名字被占用了，改为CMARefresh

        pod 'CMARefresh'

## 使用方法
* 添加属性

`@property (nonatomic, strong) CMARefreshAdapter *refreshAdapter;
`

* 初始化

        - (CMARefreshAdapter *)refreshAdapter {

            if (!_refreshAdapter) {

                _refreshAdapter = [CMARefreshAdapter adapterWithScrollView:self.tableview refreshType:CMARefreshTypeAll];

                _refreshAdapter.adapterDelegate = self;

                _refreshAdapter.adapterDatasouce = self;
    
            }

            return _refreshAdapter;

            }


* 添加代理

`<CMARefreshAdapterDelegate,CMARefreshAdapterDatasouce>
`

* 选择代理方法


        #pragma mark - CMARefreshAdapterDelegate

        - (BOOL)refreshAdapter:(CMARefreshAdapter *)adapter footerShouldEndRefreshingWithNoMoreData:(MJRefreshFooter *)footer {
        return YES;
        }

        /**头视图开始刷新时*/
        - (void)refreshAdapter:(CMARefreshAdapter *)adapter didStartRefreshHeader:(MJRefreshHeader *)header {
        }

        /**当头部在刷新时开始上拉加载，会停止下拉刷新动画，以下方法同用法*/
        - (void)refreshAdapter:(CMARefreshAdapter *)adapter willCancelRefreshHeader:(MJRefreshHeader *)header{
        }

        - (void)refreshAdapter:(CMARefreshAdapter *)adapter didCancelRefreshHeader:(MJRefreshHeader *)header {
        }

        - (void)refreshAdapter:(CMARefreshAdapter *)adapter didStartRefreshFooter:(MJRefreshFooter *)footer {
        }

        - (void)refreshAdapter:(CMARefreshAdapter *)adapter willChancelRefreshFooter:(MJRefreshFooter *)foote{
        }

        - (void)refreshAdapter:(CMARefreshAdapter *)adapter didChancelRefreshFooter:(MJRefreshFooter *)footer {
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



