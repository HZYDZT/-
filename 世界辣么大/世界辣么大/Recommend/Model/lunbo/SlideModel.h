//
//  SlideModel.h
//  世界辣么大
//
//  Created by dllo on 16/2/25.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SlideModel : NSObject
@property (nonatomic ,retain) NSString *url;
@property (nonatomic, retain) NSString *photo;
@property (nonatomic, retain) NSString *title;
- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)slideModelDic:(NSDictionary *)dic;
@end
