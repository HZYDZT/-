//
//  SlideModel.m
//  世界辣么大
//
//  Created by dllo on 16/2/25.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "SlideModel.h"

@implementation SlideModel
- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }return self;
}
+ (instancetype)slideModelDic:(NSDictionary *)dic{
    SlideModel *model = [[SlideModel alloc] initWithDic:dic];
    return model;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}
@end
