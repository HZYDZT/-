//
//  HZYNetWorkTool.h
//  ZhiFuBao
//
//  Created by dllo on 16/2/25.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
//xcode 7 之后都有调用时没有参数的情况 所以要添加参数
typedef void(^ProgressBlock)(NSProgress *progress);
typedef void(^SucessBlock)(id result);
typedef void(^FailBlock)(NSError *error);
typedef NS_ENUM(NSUInteger, ResponseType) {
    ResponseTypeDATA,
    ResponseTypeJSON,
    ResponseTypeXML,
};
//body体的类型
typedef NS_ENUM(NSUInteger, BodyType) {
    BodyTypeJSONString,
    BodyTypeNormal,
    
};
@interface HZYNetWorkTool : NSObject
/**
 *  GET请求
 *
 *  @param url          url
 *  @param parameter    参数
 *  @param header       请求头
 *  @param responseType 返回值类型
 *  @param progress     进度
 *  @param success      成功
 *  @param failure      失败
 */

+ (void)getWithURL:(NSString *)url
         parameter:(NSDictionary *)parameter
        httpHeader:(NSDictionary<NSString *, NSString*> *)header
      responseType:(ResponseType)responseType
          progress:(ProgressBlock)progress
            sucess:(SucessBlock)sucess
              fail:(FailBlock)fail;
/**
 *  POST请求
 *
 *  @param url          URL
 *  @param body         body体
 *  @param bodyType     body体类型
 *  @param httpHeader   请求头
 *  @param responseType 返回值类型
 *  @param success      成功
 *  @param fail         失败
 */

+ (void)postWithURL:(NSString *)url body:(id)body bodyType:(BodyType)bodyType parameter:(NSDictionary *)parameter httpHeader:(NSDictionary<NSString *,NSString *> *)header responseType:(ResponseType)responseType progress:(ProgressBlock)progress success:(SucessBlock)success failure:(FailBlock)failure;



@end
