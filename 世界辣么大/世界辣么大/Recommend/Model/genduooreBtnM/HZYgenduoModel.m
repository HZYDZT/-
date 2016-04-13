//
//  HZYgenduoModel.m
//  世界辣么大
//
//  Created by dllo on 16/3/5.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYgenduoModel.h"

@implementation HZYgenduoModel
- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }

}
@end
