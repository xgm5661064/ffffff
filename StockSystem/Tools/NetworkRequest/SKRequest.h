//
//  SKRequest.h
//  SKTool
//
//  Created by Sakya on 2018/5/7.
//  Copyright © 2018年 Sakya. All rights reserved.
//

#import <Foundation/Foundation.h>

//网络配置的
#import "SKAPIBaseRequestDataModel.h"
#import "SKReponseModel.h"
#import <AFNetworking.h>


#define SKRequestShare [SKRequest sharedInstance]
#if NS_BLOCKS_AVAILABLE
typedef void (^RequestCallBackBlock)(SKReponseModel * result);

#endif

@interface SKRequest : NSObject

+ (instancetype)sharedInstance;


- (void)taskStart:(SKAPIBaseRequestDataModel *)request
         callBack:(RequestCallBackBlock)callBack;
/**
 *  取消所有请求
 */
- (void)cancelAllRequest;

/**
 取消对应tag的task
 */
- (void)cancelRequestWithTag:(NSString *)tag;

@end
