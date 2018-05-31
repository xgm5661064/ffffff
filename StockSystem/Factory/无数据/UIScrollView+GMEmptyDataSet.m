//
//  UIScrollView+GMEmptyDataSet.m
//  GNRuralI
//
//  Created by 小熊 on 2017/11/16.
//  Copyright © 2017年 小熊. All rights reserved.
//

#import "UIScrollView+GMEmptyDataSet.h"
#import <objc/runtime.h>
#import "UIColor(Addition).h"
static const void *KClickBlock = @"clickBlock";
static const void *KButtonBlock = @"btnClickBlock";
static const void *KEmptyText = @"emptyText";
static const void *KSecondText = @"secoundText";
static const void *KButtonTit = @"buttonTit";
static const void *KOffSet = @"offset";
static const void *Kimage = @"emptyImage";
@implementation UIScrollView (GMEmptyDataSet)
#pragma mark - Getter Setter

- (ClickBlock)clickBlock{
    return objc_getAssociatedObject(self, &KClickBlock);
}

- (void)setClickBlock:(ClickBlock)clickBlock{
    
    objc_setAssociatedObject(self, &KClickBlock, clickBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (ButtonBlock)btnClickBlock{
    return objc_getAssociatedObject(self, &KButtonBlock);
}

- (void)setBtnClickBlock:(ButtonBlock)btnClickBlock{
    
    objc_setAssociatedObject(self, &KButtonBlock, btnClickBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)emptyText{
    return objc_getAssociatedObject(self, &KEmptyText);
}

- (void)setEmptyText:(NSString *)emptyText{
    objc_setAssociatedObject(self, &KEmptyText, emptyText, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString *)secoundText{
    return objc_getAssociatedObject(self, &KSecondText);
}

- (void)setSecoundText:(NSString *)secoundText{
    objc_setAssociatedObject(self, &KSecondText, secoundText, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString *)buttonTit{
    return objc_getAssociatedObject(self, &KButtonTit);
}

- (void)setButtonTit:(NSString *)buttonTit{
    objc_setAssociatedObject(self, &KButtonTit, buttonTit, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (CGFloat)offset{
    
    NSNumber *number = objc_getAssociatedObject(self, &KOffSet);
    return number.floatValue;
}

- (void)setOffset:(CGFloat)offset{
    
    NSNumber *number = [NSNumber numberWithDouble:offset];
    
    objc_setAssociatedObject(self, &KOffSet, number, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


- (UIImage *)emptyImage{
    return objc_getAssociatedObject(self, &Kimage);
}

- (void)setEmptyImage:(UIImage *)emptyImage{
    objc_setAssociatedObject(self, &Kimage, emptyImage, OBJC_ASSOCIATION_COPY_NONATOMIC);
}



- (void)setupEmptyData:(ClickBlock)clickBlock{
    self.clickBlock = clickBlock;
    self.emptyDataSetSource = self;
    if (clickBlock) {
        self.emptyDataSetDelegate = self;
    }
}


- (void)setupEmptyDataText:(NSString *)text tapBlock:(ClickBlock)clickBlock{
    
    self.clickBlock = clickBlock;
    self.emptyText = text;
    
    self.emptyDataSetSource = self;
    if (clickBlock) {
        self.emptyDataSetDelegate = self;
    }
}


- (void)setupEmptyDataText:(NSString *)text verticalOffset:(CGFloat)offset tapBlock:(ClickBlock)clickBlock{
    
    self.emptyText = text;
    self.offset = offset;
    self.clickBlock = clickBlock;
    
    self.emptyDataSetSource = self;
    if (clickBlock) {
        self.emptyDataSetDelegate = self;
    }
}


- (void)setupEmptyDataText:(NSString *)text secoundText:(NSString *)sectext buttonTit:(NSString *)buttext verticalOffset:(CGFloat)offset emptyImage:(UIImage *)image tapBlock:(ClickBlock)clickBlock  butClick:(ButtonBlock)btnBlock{
    
    self.emptyText = text;
    self.secoundText = sectext;
    self.buttonTit = buttext;
    self.offset = offset;
    self.emptyImage = image;
    self.clickBlock = clickBlock;
    self.btnClickBlock = btnBlock;
    self.emptyDataSetSource = self;
    if (clickBlock) {
        self.emptyDataSetDelegate = self;
    }
    if (btnBlock) {
        self.emptyDataSetDelegate = self;
    }
    
}



#pragma mark - DZNEmptyDataSetSource

// 空白界面的标题
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
    NSString *text = self.emptyText;
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    paragraph.lineSpacing = 5;
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:14],
                                 NSForegroundColorAttributeName: [UIColor colorWithHexString:@"#41495c"],
                                 NSParagraphStyleAttributeName: paragraph};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

// 空白页的图片
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
    return self.emptyImage?:[UIImage imageNamed:@"orderimg"];
}
//设置二级标题
- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = self.secoundText;
    
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:12],
                                 NSForegroundColorAttributeName: [UIColor colorWithHexString:@"#878f94"],
                                 NSParagraphStyleAttributeName: paragraphStyle};
    
    return [[NSMutableAttributedString alloc] initWithString:text attributes:attributes];
}

//设置按钮
- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    NSString *text = self.buttonTit;
    UIColor *color = nil;
    if (state == UIControlStateNormal) color = [UIColor whiteColor];
    if (state == UIControlStateHighlighted) color = [UIColor lightGrayColor];
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:14.0],
                                 NSForegroundColorAttributeName: color,
                                 NSParagraphStyleAttributeName: paragraphStyle};
    
    return [[NSMutableAttributedString alloc] initWithString:text attributes:attributes];
}
- (UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    NSString *imageName =self.buttonTit?@"background_normal":@"";
    UIEdgeInsets capInsets = UIEdgeInsetsMake(22.0, 22.0, 22.0, 22.0);
    UIEdgeInsets rectInsets = UIEdgeInsetsMake(0.0, -100, 0.0, -100);
    UIImage *image = [UIImage imageNamed:imageName];
    return [[image resizableImageWithCapInsets:capInsets resizingMode:UIImageResizingModeStretch] imageWithAlignmentRectInsets:rectInsets];
}

//是否允许滚动，默认NO
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    return YES;
}

// 垂直偏移量
- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView{
    return self.offset;
}
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView{
    return YES;
}
#pragma mark - DZNEmptyDataSetDelegate

- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view{
    if (self.clickBlock) {
        self.clickBlock();
    }
}
- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button{
    NSLog(@"点击了按钮");
    if (self.btnClickBlock) {
        self.btnClickBlock();
    }
}

@end
