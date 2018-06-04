//
//  SKRequest.m
//  SKTool
//
//  Created by Sakya on 2018/5/7.
//  Copyright © 2018年 Sakya. All rights reserved.
//

#import "SKRequest.h"

//网络检测
#import <sys/socket.h>
#import <netinet/in.h>
#import <arpa/inet.h>
#import <netdb.h>
#import <SystemConfiguration/SCNetworkReachability.h>
#import <SystemConfiguration/CaptiveNetwork.h>





@interface SKRequest() <NSURLSessionDelegate>



// 根据 requestid，存放 task
@property (nonatomic, strong) NSMutableDictionary *dispatchTable;
//
@property (nonatomic, strong) SKAPIBaseRequestDataModel *requestConfig;



@end

@implementation SKRequest

static AFHTTPSessionManager *sessionManager;
static AFJSONRequestSerializer *shareJSONSerializer;
static AFHTTPRequestSerializer *shareHTTPSerializer;
static AFNetworkReachabilityManager *networkManager;

#pragma mark - life cycle
#pragma mark - public methods
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static SKRequest *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[SKRequest alloc] init];
    });
    return sharedInstance;
}
#pragma mark - Manager
- (AFHTTPSessionManager *)manager{
    static dispatch_once_t onceToken;
    dispatch_once(& onceToken, ^{
        sessionManager = [AFHTTPSessionManager manager];
    });
    return sessionManager;
}
- (AFJSONRequestSerializer *)JSONSerializer {
    static dispatch_once_t onceToken;
    dispatch_once(& onceToken, ^{
        shareJSONSerializer = [AFJSONRequestSerializer serializer];
    });
    return shareJSONSerializer;
}
- (AFHTTPRequestSerializer *) HTTPSerializer {
    static dispatch_once_t onceToken;
    dispatch_once(& onceToken, ^{
        shareHTTPSerializer = [AFHTTPRequestSerializer serializer];
    });
    return shareHTTPSerializer;
}
- (void)setRequestConfig:(SKAPIBaseRequestDataModel *)request {
//设置超时时间
    if ([self manager].requestSerializer.timeoutInterval != request.timeoutInterval) {
        [[self manager].requestSerializer willChangeValueForKey:@"timeoutInterval"];
        [[self manager].requestSerializer setTimeoutInterval:request.timeoutInterval];
        [[self manager].requestSerializer didChangeValueForKey:@"timeoutInterval"];
    }
//    Request
    switch (request.requestSerializer) {
        case SKHTTPRequestSerializer:
             [[self manager] setRequestSerializer:[self HTTPSerializer]];
            break;
        default:
            [[self manager] setRequestSerializer:[self JSONSerializer]];
            break;
    }
    //    response
    switch (request.responseSerializer) {
        case SKJSONResponseSerializer:
            [self manager].responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        default:
            [self manager].responseSerializer = [AFJSONResponseSerializer serializer];
            break;
    }
    [self manager].responseSerializer.acceptableContentTypes = request.contentTypes;
    
    [request.httpHeaderFields enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [[self manager].requestSerializer setValue:obj forHTTPHeaderField:key];
    }];
}

- (void)taskStart:(SKAPIBaseRequestDataModel *)request
         callBack:(RequestCallBackBlock)callBack {
    
    //网络验证
    if ([self isNetworkReachable] ==NO){

    }
    //请求设置的
    [self setRequestConfig:request];
    __block SKReponseModel *reponseModel;
    switch (request.method) {
        case GET:{
            NSURLSessionDataTask *task =[[self manager] GET:request.urlPath parameters:request.params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                reponseModel = [[SKReponseModel alloc] initWithJsonData:responseObject];
                reponseModel.taskTag = request.taskTag;
                callBack(reponseModel);
                [self removeRequestTask:task];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                callBack(reponseModel);
            }];
            [SKRequestShare.dispatchTable setObject:task forKey:request.taskTag];
        }
            break;
        case POST:{
            NSURLSessionDataTask *dataTask = [[self manager] POST:request.urlPath parameters:request.params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                
            } progress:^(NSProgress * _Nonnull uploadProgress) {
                //                if (reponseModel) {
                //                    reponseModel.progress(uploadProgress);
                //                };
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                reponseModel = [[SKReponseModel alloc] initWithJsonData:responseObject];
                reponseModel.taskTag = request.taskTag;
                callBack(reponseModel);
                [self removeRequestTask:task];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self removeRequestTask:task];
                reponseModel.taskTag = request.taskTag;
                reponseModel = [[SKReponseModel alloc] initWithError:error];
                callBack(reponseModel);
            }];
            [SKRequestShare.dispatchTable setObject:dataTask forKey:request.taskTag];
        }
            break;
        case PUT:
            
            break;
        case DELETE:
            
            break;
        case UPLOAD:
            /**
             UIImage *image = [UIImage imageNamed:@"xxx.png"];
             NSData *imageData = UIImagePNGRepresentation(image);
             //使用formData拼接数据
             方法一:
             第一个参数:二进制数据 要上传的文件参数
             第二个参数:服务器规定的
             第三个参数:文件上传到服务器以什么名称保存
             
             [formData appendPartWithFileData:imageData name:@"file" fileName:@"xxx.png" mimeType:@"image/png"];
             
             //方法二:
             [formData appendPartWithFileURL:[NSURL fileURLWithPath:@""] name:@"file" fileName:@"xxx.png" mimeType:@"image/png" error:nil];
             
             //方法三:
             [formData appendPartWithFileURL:[NSURL fileURLWithPath:@""] name:@"file" error:nil];
             */
            
            break;
        case DOWNLOAD: {
            reponseModel = [[SKReponseModel alloc] init];
            reponseModel.taskTag = request.taskTag;
            NSURLRequest *requestUrlPath = [NSURLRequest requestWithURL:[NSURL URLWithString:request.urlPath]];
            NSURLSessionDownloadTask *dataTask = [[self manager] downloadTaskWithRequest:requestUrlPath progress:^(NSProgress * _Nonnull downloadProgress) {
                NSLog(@"%@",downloadProgress);
                //                reponseModel.progress ? reponseModel.progress(downloadProgress) : nil;
                //                callBack(reponseModel);
                //                if (reponseModel) {
                //                    reponseModel.progress(downloadProgress);
                //                };
                reponseModel.progress = downloadProgress;
                callBack(reponseModel);
            } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
                return  [NSURL fileURLWithPath:request.downloadPath];;
            } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
                [self cancelRequestWithTag:request.taskTag];
                if (!error) {
                    callBack(reponseModel);
                } else {
                    reponseModel = [[SKReponseModel alloc] init];
                    reponseModel.taskTag = request.taskTag;
                    callBack(reponseModel);
                }
            }];
            [dataTask resume];
            [SKRequestShare.dispatchTable setObject:dataTask forKey:request.taskTag];
        }
            break;
        default:
            break;
    }
}


#pragma mark --cancel task
- (void)cancelAllRequest {
    [[self manager].operationQueue cancelAllOperations];
    [SKRequestShare.dispatchTable enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSURLSessionDataTask class]]) {
            if (obj) [obj cancel];
            [SKRequestShare.dispatchTable removeObjectForKey:key];
        }
    }];
}
- (void)cancelRequestWithTag:(NSString *)tag {
    if (tag) {
        NSURLSessionDataTask *task = [SKRequestShare.dispatchTable objectForKey:tag];
        [SKRequestShare.dispatchTable removeObjectForKey:tag];
        if (task) [task cancel];
    }
}
- (void)removeRequestTask:(NSURLSessionDataTask *)task {
    [SKRequestShare.dispatchTable enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isEqual:task]) {
            [SKRequestShare.dispatchTable removeObjectForKey:key];
        }
    }];
}

#pragma mark - getters and setters
- (NSMutableDictionary *)dispatchTable{
    if (_dispatchTable == nil) {
        _dispatchTable = [[NSMutableDictionary alloc] init];
    }
    return _dispatchTable;
}


/**
 *  判断网络是否可用
 *
 *  @return 判断结果 BOOL
 */
- (BOOL)isNetworkReachable{
    struct sockaddr_in zeroAddress;
    bzero (&zeroAddress, sizeof (zeroAddress));
    zeroAddress. sin_len = sizeof (zeroAddress);
    zeroAddress. sin_family = AF_INET ;
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress ( NULL , ( struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags (defaultRouteReachability, &flags);
    CFRelease (defaultRouteReachability);
    if (!didRetrieveFlags){return NO;}
    BOOL isReachable = flags & kSCNetworkFlagsReachable ;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired ;
    return (isReachable && !needsConnection) ? YES : NO ;
}

@end
