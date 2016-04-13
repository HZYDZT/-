//
//  HZYdestModel.m
//  世界辣么大
//
//  Created by dllo on 16/2/29.
//  Copyright © 2016年 洪振宇. All rights reserved.
//
#import "HZYdestModel.h"
#import "HZYdestChildModel.h"
@implementation HZYdestModel
+(instancetype)destModelWithDic:(NSDictionary *)dic{
    HZYdestModel *model = [HZYdestModel new];
    model.ID = dic[@"id"];
    model.cnname = dic[@"cnname"];
    model.enname = dic[@"enname"];
    model.hotArr = [NSMutableArray new];
    NSArray *hotTemp = dic[@"hot_country"];
    for (NSDictionary *hotDic in hotTemp) {
        HZYdestChildModel *child = [HZYdestChildModel childModelWithDic:hotDic];
        [model.hotArr addObject:child];
    }
    NSArray *countryTemp = dic[@"country"];
    model.country = [NSMutableArray new];
    for (NSDictionary *countryDci in countryTemp) {
        HZYdestChildModel *child = [HZYdestChildModel childModelWithDic:countryDci];
        [model.country addObject:child];
    }
    return model;
}
@end
