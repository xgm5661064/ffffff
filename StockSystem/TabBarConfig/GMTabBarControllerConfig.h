//
//  GMTabBarControllerConfig.h
//  StockSystem
//
//  Created by 小熊 on 2018/5/23.
//  Copyright © 2018年 小熊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYLTabBarController.h"
@interface GMTabBarControllerConfig : NSObject
@property (nonatomic, readonly, strong) CYLTabBarController *tabBarController;
@property (nonatomic, copy) NSString *context;
@end
