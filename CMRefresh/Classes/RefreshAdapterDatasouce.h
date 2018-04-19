//
//  RefreshAdapterDatasouce.h
//  Pods
//
//  Created by on 2017/8/15.
//
//

#import <Foundation/Foundation.h>

@class RefreshAdapter;
@class MJRefreshHeader;
@class MJRefreshFooter;

@protocol RefreshAdapterDatasouce <NSObject>

@optional;
- (Class)refreshHeaderOfClass;

- (Class)refreshFooterOfClass;
@end
