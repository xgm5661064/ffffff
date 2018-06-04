//
//  SKAPIBaseRequestDataModel.m
//  SKTool
//
//  Created by Sakya on 2018/5/7.
//  Copyright © 2018年 Sakya. All rights reserved.
//

#import "SKAPIBaseRequestDataModel.h"


@implementation SKAPIRequestUtil
+ (NSString *)hashTaskWithTag:(NSString *)task {
    NSString *hashTask = [NSString stringWithFormat:@"%lu", (unsigned long)[task hash]];
    return hashTask;
}
@end
@implementation SKAPIBaseRequestDataModel
#pragma mark --getter
- (NSSet *)contentTypes {
    if (!_contentTypes) {
        _contentTypes = [NSSet setWithObjects:@"application/json",@"application/xml",@"text/json",@"text/javascript",@"text/html",@"text/plain",nil];
    }
    return _contentTypes;
}
- (NSTimeInterval)timeoutInterval {
    if (!_timeoutInterval) {
        _timeoutInterval = 60;
    }
    return _timeoutInterval;
}
- (NSString *)taskTag {
    if (!_taskTag) {
        _taskTag = [SKAPIRequestUtil hashTaskWithTag:_urlPath];
    }
    return _taskTag;
}

@end
