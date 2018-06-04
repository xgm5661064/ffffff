//
//  SKAPIBaseRequestDataModel.h
//  SKTool
//
//  Created by Sakya on 2018/5/7.
//  Copyright © 2018年 Sakya. All rights reserved.
//

#import <Foundation/Foundation.h>

//请求方法
typedef NS_ENUM (NSUInteger, SKAPIManagerRequestType){
    GET = 0,
    POST = 1,
    PUT,
    DELETE,
    UPLOAD,
    DOWNLOAD
};
typedef NS_ENUM (NSUInteger, SKRequestSerializer){
    SKJSONRequestSerializer = 0,
    SKHTTPRequestSerializer
};
typedef NS_ENUM (NSUInteger, SKResponseSerializer){
    SKJSONResponseSerializer = 0,
    SKHTTPResponseSerializer
};

@interface SKAPIRequestUtil:NSObject
+ (NSString *)hashTaskWithTag:(NSString *)task;

@end

@interface SKAPIBaseRequestDataModel : NSObject
/**
 *  域名
 */
@property (nonatomic, copy) NSString *baseURL;

@property (nonatomic, strong) NSSet *contentTypes;
@property (nonatomic, assign) SKRequestSerializer requestSerializer;
@property (nonatomic, assign) SKResponseSerializer responseSerializer;

/**
 tag
 */
@property (nonatomic, copy) NSString *taskTag;

/**
 *  请求路径
 */
@property(nonatomic, copy) NSString *urlPath;
/**
 *  请求方式
 */
@property (nonatomic, assign) SKAPIManagerRequestType method;
/**
 *  Http头参数设置
 */
@property (nonatomic, strong) NSDictionary *httpHeaderFields;
/**
 *  使用字典参数
 */
@property (nonatomic, strong) NSDictionary *params;
/**
 *  默认是60S
 */
@property (nonatomic, assign) NSTimeInterval timeoutInterval;
/**
 *  上传文件字典
 */
@property (nonatomic, strong) NSDictionary *requestFiles_Upload;
/**
 *  上传图组
 */
@property (nonatomic, strong) NSArray *requestImages;
/**
 *  下载文件路径
 */
@property (nonatomic, copy) NSString *downloadPath;


@end
