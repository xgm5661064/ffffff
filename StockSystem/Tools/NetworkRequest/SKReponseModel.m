//
//  SKReponseModel.m
//  SKTool
//
//  Created by Sakya on 2018/5/7.
//  Copyright © 2018年 Sakya. All rights reserved.
//

#import "SKReponseModel.h"

@implementation SKReponseModel
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super init]) {
        NSDictionary * dict = dictionary;
        self.jsonDict = dictionary;
        self.status = [[dict objectForKey:@"status"] intValue];
        self.message = [dict objectForKey:@"message"];
        self.data = [dict objectForKey:@"content"];
        NSLog(@"NetworkModelStatusType:(%zd）",self.status);
        NSLog(@"message:(%@)",self.message);
        NSLog(@"content:(%@)",self.data);
        NSDictionary *errorDict = [dict objectForKey:@"inputError"];
        if (errorDict) {
         
        }
    }
    return self;
}
- (instancetype)initWithError:(NSError *)error {
    
    self = [super init];
    return self;
}
- (instancetype)initWithJsonData:(NSData *)jsonData {
    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *dict = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&error];
    
    if (dict == nil || [dict count] <= 0) {
        self = [super init];
        if (self) {
            self.status = NetworkModelStatusTypeNoContent;
            self.message = @"服务器返回数据为空！";
            if(error != nil){
                self.status = NetworkModelStatusTypeServerDataFromatError;
                self.message = @"服务器返回数据格式有误！";
            }
            self.data = jsonStr;
            NSLog(@"NetworkModelStatusType---(%zd",self.status);
            NSLog(@"jsonStr---(%@)",jsonStr);
            NSLog(@"message---(%@)",self.message);
        }
    }
    else{
        self = [self initWithDictionary:dict];
    }
    return self;
}
- (NSString *)description{
    return [NSString stringWithFormat:@"---（%zd）---%@---",self.status,self.message];
}
+ (void)alert:(SKReponseModel*)result{
    
}
@end
