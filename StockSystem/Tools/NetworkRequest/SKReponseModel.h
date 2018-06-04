//
//  SKReponseModel.h
//  SKTool
//
//  Created by Sakya on 2018/5/7.
//  Copyright © 2018年 Sakya. All rights reserved.
//

#import <Foundation/Foundation.h>
//网络请求服务器返回的状态码的类型
typedef NS_ENUM(NSInteger,NetworkModelStatusType) {
    /**服务器返回内容为空*/
    NetworkModelStatusTypeNoContent = -100,
    /**服务器返回的格式有误*/
    NetworkModelStatusTypeServerDataFromatError = -101,
    /**服务器异常错误*/
    NetworkModelStatusTypeServerUnusualError = -200,
    /**网络请求成功类型*/
    NetworkModelStatusTypeSuccess = 200,
    /**客户端输入有误*/
    NetworkModelStatusTypeInputError = 400,
    /**表示用户没有权限（令牌、用户名、密码错误）*/
    NetworkModelStatusTypeNoRightToAccess = 401,
    /** 表示用户得到授权（与401错误相对），但是访问是被禁止的*/
    NetworkModelStatusTypeForbidToAccess = 403,
    /**用户发出的请求针对的是不存在的记录，服务器没有进行操作*/
    NetworkModelStatusTypeNoRecord = 404,
    /**用户请求的格式不可得（比如用户请求JSON格式，但是只有XML格式*/
    NetworkModelStatusTypeFormatError = 405,
    /**用户请求的资源被永久删除，且不会再得到的*/
    NetworkModelStatusTypeResourcesNotFind = 410,
    /**服务器发生错误，用户将无法判断发出的请求是否成功*/
    NetworkModelStatusTypeServerError = 500,
    /**其他错误*/
    NetworkModelStatusTypeOtherError = 501,
    /**用户未登陆*/
    NetworkModelStatusTypeUserNoLogin = 1000,
    
};
//callBack中的状态码
typedef NS_ENUM(NSInteger,CallBackStatus) {
    /**请求成功，服务器返回200*/
    CallBackStatusSuccess = 0,
    /**请求错误，服务器返回自定义错误码*/
    CallBackStatusRequestError = 1,
    /**请求失败，服务器出错*/
    CallBackStatusRequestFailure = 2
};

// 请求进度回调
typedef void(^SKProgressBlock)(NSProgress * __nullable progress);

@interface SKReponseModel:NSObject
/**
 *  网络请求返回的状态码
 *
 */
@property (nonatomic, assign) NetworkModelStatusType status;

/**
 返回数据的taskTag
 */
@property (nonatomic, copy) NSString * _Nullable taskTag;
/**
 *  网络返回的message消息
 */
@property (nonatomic, strong) NSString * _Nullable message;
/**
 *  网络返回的json字典
 */
@property (nonatomic, strong) NSDictionary * _Nonnull jsonDict;
/**
 *  网络请求成功时返回content内容
 */
@property (nonatomic, strong) id _Nullable data;

/**
 API上传、下载等长时间执行的Progress进度
 */
//@property (nonatomic, copy) SKProgressBlock progress;
@property (nonatomic, strong) NSProgress * _Nullable progress;

/*__nullable 表示对象可以是 NULL 或 nil，而__nonnull 表示对象不应该为空*/

+ (void)alert:(SKReponseModel*_Nullable)result;
/**
 *  以jsonData初始化
 *
 *  @param jsonData json格式数据
 *
 *  @return 字典对象
 */
- (instancetype _Nullable )initWithJsonData:(NSData *_Nullable)jsonData;
- (instancetype _Nullable )initWithError:(NSError *_Nullable)error;
/**
 *  打印请求
 *
 *  @return 打印网络模型的状态码和message
 */
- (NSString *_Nullable)description;

@end
