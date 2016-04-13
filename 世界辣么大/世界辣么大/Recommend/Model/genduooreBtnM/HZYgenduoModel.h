
//
//  HZYgenduoModel.h
//  世界辣么大
//
//  Created by dllo on 16/3/5.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZYgenduoModel : NSObject
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *departureTime;
@property (nonatomic, copy) NSString *productType;
@property (nonatomic, copy) NSString *booktype;
@property (nonatomic, copy) NSString *first_pub;
@property (nonatomic, copy) NSString *end_date;
@property (nonatomic, copy) NSString *feature;
@property (nonatomic, copy) NSString *lastminute_des;
@property (nonatomic, copy) NSString *buy_price;
@property (nonatomic, copy) NSString *pic;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *self_use;
@property (nonatomic, copy) NSString *perperty_today_new;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *sale_count;
@property (nonatomic, copy) NSString *firstpay_end_time;
@property (nonatomic, copy) NSString *list_price;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
