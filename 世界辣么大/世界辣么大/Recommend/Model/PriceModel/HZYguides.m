//
//  HZYguides.m
//  世界辣么大
//
//  Created by dllo on 16/3/3.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYguides.h"

@implementation HZYguides
- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }return self;
}
+ (instancetype)guidesWithDic:(NSDictionary *)dic{
    HZYguides *model = [[HZYguides alloc] initWithDic:dic];
    return model;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}
@end
