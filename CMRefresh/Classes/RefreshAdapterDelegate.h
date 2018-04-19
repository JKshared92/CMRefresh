//
//  RefreshAdapterDelegate.h
//  Pods
//
//  Created by on 2017/8/14.
//
//

#import <Foundation/Foundation.h>

@class RefreshAdapter;
@class MJRefreshHeader;
@class MJRefreshFooter;

@protocol RefreshAdapterDelegate <NSObject>

@optional
    
- (BOOL)refreshAdapter:(RefreshAdapter *)adapter footerShouldEndRefreshingWithNoMoreData:(MJRefreshFooter *)footer;

- (void)refreshAdapter:(RefreshAdapter *)adapter didStartRefreshHeader:(MJRefreshHeader *)header;

- (void)refreshAdapter:(RefreshAdapter *)adapter willCancelRefreshHeader:(MJRefreshHeader *)header;

- (void)refreshAdapter:(RefreshAdapter *)adapter didCancelRefreshHeader:(MJRefreshHeader *)header;

- (void)refreshAdapter:(RefreshAdapter *)adapter didStartRefreshFooter:(MJRefreshFooter *)footer;

- (void)refreshAdapter:(RefreshAdapter *)adapter willChancelRefreshFooter:(MJRefreshFooter *)footer;

- (void)refreshAdapter:(RefreshAdapter *)adapter didChancelRefreshFooter:(MJRefreshFooter *)footer;


@end
