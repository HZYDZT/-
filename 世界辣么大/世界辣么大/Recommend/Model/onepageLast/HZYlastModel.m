//
//  HZYlastModel.m
//  世界辣么大
//
//  Created by dllo on 16/3/4.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYlastModel.h"

@implementation HZYlastModel
- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }return self;
}
+ (instancetype)lastModelDic:(NSDictionary *)dic{
    HZYlastModel *model = [[HZYlastModel alloc] initWithDic:dic];
    return model;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
}
@end
