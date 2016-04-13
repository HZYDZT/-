//
//  HZYhotel.h
//  世界辣么大
//
//  Created by dllo on 16/3/9.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZYhotel : NSObject
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *area_name;
@property (nonatomic, copy) NSString *lon;
@property (nonatomic, copy) NSString *star;
@property (nonatomic, copy) NSString *link;
@property (nonatomic, copy) NSNumber *ranking;
@property (nonatomic, copy) NSString *enname;
@property (nonatomic, copy) NSNumber *price;
@property (nonatomic, copy) NSString *lat;
@property (nonatomic, copy) NSString *cnname;
@property (nonatomic, copy) NSString *distance;
@property (nonatomic, copy) NSString *photo;
@property (nonatomic, copy) NSString *is_recommend;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
