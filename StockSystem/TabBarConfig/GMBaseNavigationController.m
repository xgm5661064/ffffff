//
//  GMBaseNavigationController.m
//  StockSystem
//
//  Created by 小熊 on 2018/5/23.
//  Copyright © 2018年 小熊. All rights reserved.
//

#import "GMBaseNavigationController.h"

@interface GMBaseNavigationController ()

@end

@implementation GMBaseNavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        //返回按钮自定义
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithImage:[UIImage imageNamed:@"navigationButtonReturn"] WithHighlightedImage:[UIImage imageNamed:@"navigationButtonReturnClick"] Target:self action:@selector(backViewController) title:@"返回"];
    }
    [super pushViewController:viewController animated:animated];
}
/**
 返回
 */
-(void)backViewController
{
    [self popViewControllerAnimated:YES];
}
@end
