//
//  UIBarButtonItem+GMBarButtonitem.h
//  StockSystem
//
//  Created by 小熊 on 2018/5/23.
//  Copyright © 2018年 小熊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (GMBarButtonitem)
/**
创建一个含有点击事件和高亮的系统按钮
 */

+(UIBarButtonItem *)ItemWithImage:(UIImage *)image WithHighlighted:(UIImage *)HighlightedImage Target:(id)target action:(SEL)action;

/**
 创建一个含有点击事件和选中状态的系统按钮
 */
+(UIBarButtonItem *)ItemWithImage:(UIImage *)image WithSelected:(UIImage *)SelectedImage Target:(id)target action:(SEL)action;

/**
 返回
 */
+(UIBarButtonItem *)backItemWithImage:(UIImage *)image WithHighlightedImage:(UIImage *)HighlightedImage Target:(id)target action:(SEL)action title:(NSString *)title;
@end
