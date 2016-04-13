//
//  HZYNetWorkTool.m
//  ZhiFuBao
//
//  Created by dllo on 16/2/25.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYNetWorkTool.h"

@implementation HZYNetWorkTool
+ (void)getWithURL:(NSString *)url parameter:(NSDictionary *)parameter httpHeader:(NSDictionary<NSString *, NSString*> *)header responseType:(ResponseType)responseType progress:(ProgressBlock)progress sucess:(SucessBlock)sucess fail:(FailBlock)fail{
    //1初始化sesionmanager
    AFHTTPSessionManager *mangager = [AFHTTPSessionManager manager];
    //2处理请求头
    for (NSString *key in header.allKeys) {
        [mangager.requestSerializer setValue:header[key] forHTTPHeaderField:key];
    }
    //3处理返回值类型
    switch (responseType) {
        case ResponseTypeDATA:
            mangager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        case ResponseTypeJSON:
            mangager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        case ResponseTypeXML:
            mangager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
    }
    //4设置返回值支持的文本类型
    [mangager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil]];
    
    
    
    [mangager GET:url parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        if (progress) {
            //如果为空还被调用会出错
            progress(downloadProgress);
            
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (sucess) {
            sucess(responseObject);
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            fail(error);
            
        }
    }];
}
+ (void)postWithURL:(NSString *)url body:(id)body bodyType:(BodyType)bodyType  parameter:(NSDictionary *)parameter httpHeader:(NSDictionary<NSString *,NSString *> *)header responseType:(ResponseType)responseType progress:(ProgressBlock)progress success:(SucessBlock)success failure:(FailBlock)failure{
    
    
    //初始化sessionManager
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //2.处理请求头
    for (NSString *key in header.allKeys) {
        [manager.requestSerializer setValue:header[key] forHTTPHeaderField:key];
    }
    //3.处理返回值类型
    switch (responseType) {
        case ResponseTypeJSON:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        case ResponseTypeDATA:
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        case ResponseTypeXML:
            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
    }
    //4.判断返回值接受的具体类型
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil]];
    
    
    //5处理body类型
    switch (bodyType) {
        case BodyTypeNormal:
            manager.requestSerializer = [AFJSONRequestSerializer serializer];
            break;
        case BodyTypeJSONString:
            [manager.requestSerializer setQueryStringSerializationWithBlock:^NSString * _Nonnull(NSURLRequest * _Nonnull request, id  _Nonnull parameters, NSError * _Nullable __autoreleasing * _Nullable error) {
                return parameters;
            }];
            break;
    }
    
    
    [manager POST:url parameters:body progress:^(NSProgress * _Nonnull uploadProgress) {
        
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            failure(error);
        }
        
    }];
    
    
    
}
@end
