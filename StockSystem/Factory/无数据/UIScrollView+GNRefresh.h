//
//  UIScrollView+GNRefresh.h
//  GNRuralI
//
//  Created by 小熊 on 2017/11/16.
//  Copyright © 2017年 小熊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (GNRefresh)
- (void)setRefreshWithHeaderBlock:(void(^)(void))headerBlock
                      footerBlock:(void(^)(void))footerBlock;


/**开始刷新*/
- (void)headerBeginRefreshing;
/**结束刷新*/
- (void)headerEndRefreshing;
/**结束加载更多*/
- (void)footerEndRefreshing;
/**加载更多无数据*/
- (void)footerNoMoreData;
/**隐藏头部刷新*/
- (void)hideHeaderRefresh;
/**隐藏尾部刷新*/
- (void)hideFooterRefresh;

@end
