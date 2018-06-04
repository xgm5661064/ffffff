//
//  UncaughtExceptionHandler.h
//  SKTool
//
//  Created by Sakya on 2018/5/7.
//  Copyright © 2018年 Sakya. All rights reserved.
//

#import <Foundation/Foundation.h>

//pod 'AvoidCrash'
//pod 'NullSafe'

@interface UncaughtExceptionHandler : NSObject
+ (void)setDefaultHandler;
+ (NSUncaughtExceptionHandler *)getHandler;
+ (void)TakeException:(NSException *) exception;
@end
