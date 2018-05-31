//
//  UIScrollView+GMEmptyDataSet.h
//  GNRuralI
//
//  Created by 小熊 on 2017/11/16.
//  Copyright © 2017年 小熊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>
typedef void(^ClickBlock)(void);
typedef void(^ButtonBlock)(void);
@interface UIScrollView (GMEmptyDataSet)<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>
@property (nonatomic) ClickBlock clickBlock;                // 点击事件
@property (nonatomic) ButtonBlock btnClickBlock;                // 点击事件
@property (nonatomic, assign) CGFloat offset;               // 垂直偏移量
@property (nonatomic, strong) NSString *emptyText;          // 空数一级标题
@property (nonatomic, strong) NSString *secoundText;        // 空数据二级标题
@property (nonatomic, strong) UIImage *emptyImage;          // 空数据的图片
@property (nonatomic, strong) NSString *buttonTit;          // 空数据按钮标题

- (void)setupEmptyData:(ClickBlock)clickBlock;
- (void)setupEmptyDataText:(NSString *)text tapBlock:(ClickBlock)clickBlock;
- (void)setupEmptyDataText:(NSString *)text verticalOffset:(CGFloat)offset tapBlock:(ClickBlock)clickBlock;
- (void)setupEmptyDataText:(NSString *)text secoundText:(NSString *)sectext buttonTit:(NSString *)buttext verticalOffset:(CGFloat)offset emptyImage:(UIImage *)image tapBlock:(ClickBlock)clickBlock  butClick:(ButtonBlock)btnClickBlock;

@end
