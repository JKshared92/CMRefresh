//
//  CMARefreshAdapterDatasouce.h
//  Pods
//
//  Created by on 2017/8/15.
//
//

#import <Foundation/Foundation.h>

@class CMARefreshAdapter;
@class MJRefreshHeader;
@class MJRefreshFooter;

@protocol CMARefreshAdapterDatasouce <NSObject>

@optional;
- (Class)refreshHeaderOfClass;

- (Class)refreshFooterOfClass;
@end
