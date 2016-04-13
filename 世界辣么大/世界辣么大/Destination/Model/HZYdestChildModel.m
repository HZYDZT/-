//
//  HZYdestChildModel.m
//  世界辣么大
//
//  Created by dllo on 16/3/18.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYdestChildModel.h"

@implementation HZYdestChildModel


+(instancetype)childModelWithDic:(NSDictionary *)dic{
    
    HZYdestChildModel *model =[HZYdestChildModel new];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
}

@end
