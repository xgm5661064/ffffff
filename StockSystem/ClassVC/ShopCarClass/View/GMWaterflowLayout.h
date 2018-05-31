//
//  GMWaterflowLayout.h
//  StockSystem
//
//  Created by 小熊 on 2018/5/29.
//  Copyright © 2018年 小熊. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GMWaterflowLayout;
@protocol GMWaterflowLayoutDelegate <NSObject>
@required
/**必须要实现这个代理*/
- (CGFloat)waterflowLayout:(GMWaterflowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth;

@optional
/**设置瀑布流每一行的个数*/
- (CGFloat)columnCountInWaterflowLayout:(GMWaterflowLayout *)waterflowLayout;
/**设置瀑布流上下间距*/
- (CGFloat)columnMarginInWaterflowLayout:(GMWaterflowLayout *)waterflowLayout;
/**设置瀑布流左右间距*/
- (CGFloat)rowMarginInWaterflowLayout:(GMWaterflowLayout *)waterflowLayout;
/**设置瀑布流的间距*/
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(GMWaterflowLayout *)waterflowLayout;
@end
@interface GMWaterflowLayout : UICollectionViewLayout
/** 代理 */
@property (nonatomic, weak) id<GMWaterflowLayoutDelegate> delegate;
@end
