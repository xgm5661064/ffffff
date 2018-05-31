//
//  UIImageView+ZJMasonryKit.h
//  ZJUIKit
//
//  Created by dzj on 2018/1/17.
//  Copyright © 2018年 kapokcloud. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZJKitMasonryTool.h"

@interface UIImageView (ZJMasonryKit)

/**
 *快速创建一个imageview
 */
+(instancetype)zj_imageView;
/**
 *快速创建一个imageview，图片名字
 */
+(instancetype)zj_imageViewWithImage:(id)image;
/**
 *快速创建一个imageview，图片名字，父视图，massary布局
 */
+(instancetype)zj_imageViewWithImage:(id)image
                               SuperView:(UIView *)superView
                             constraints:(ZJConstrainMaker)constraints;
/**
 *快速创建一个imageview，图片名字，父视图，massary布局，图片点击回调
 */
+(instancetype)zj_imageViewWithImage:(id)image
                               SuperView:(UIView *)superView
                             constraints:(ZJConstrainMaker)constraints
                              imgViewTap:(ZJTapGestureBlock)imgViewTap;

/**
 *快速创建一个imageview，图片名字，父视图，图片填充格式，massary布局，是否允许切割
 */
+(instancetype)zj_imageViewWithImage:(id)image
                               SuperView:(UIView *)superView
                             contentMode:(UIViewContentMode)contentMode
                                  isClip:(BOOL)isClip
                             constraints:(ZJConstrainMaker)constraints;
/**
 *快速创建一个imageview，图片名字，父视图，图片填充格式，massary布局，图片点击回调，是否允许切割
 */
+(instancetype)zj_imageViewWithImage:(id)image
                               SuperView:(UIView *)superView
                             contentMode:(UIViewContentMode)contentMode
                                  isClip:(BOOL)isClip
                             constraints:(ZJConstrainMaker)constraints
                              imgViewTap:(ZJTapGestureBlock)imgViewTap;

@end
