//
//  CMARefreshAdapterDelegate.h
//  Pods
//
//  Created by on 2017/8/14.
//
//

#import <Foundation/Foundation.h>

@class CMARefreshAdapter;
@class MJRefreshHeader;
@class MJRefreshFooter;

@protocol CMARefreshAdapterDelegate <NSObject>

@optional
    
- (BOOL)refreshAdapter:(CMARefreshAdapter *)adapter footerShouldEndRefreshingWithNoMoreData:(MJRefreshFooter *)footer;

- (void)refreshAdapter:(CMARefreshAdapter *)adapter didStartRefreshHeader:(MJRefreshHeader *)header;

- (void)refreshAdapter:(CMARefreshAdapter *)adapter willCancelRefreshHeader:(MJRefreshHeader *)header;

- (void)refreshAdapter:(CMARefreshAdapter *)adapter didCancelRefreshHeader:(MJRefreshHeader *)header;

- (void)refreshAdapter:(CMARefreshAdapter *)adapter didStartRefreshFooter:(MJRefreshFooter *)footer;

- (void)refreshAdapter:(CMARefreshAdapter *)adapter willChancelRefreshFooter:(MJRefreshFooter *)footer;

- (void)refreshAdapter:(CMARefreshAdapter *)adapter didChancelRefreshFooter:(MJRefreshFooter *)footer;


@end
