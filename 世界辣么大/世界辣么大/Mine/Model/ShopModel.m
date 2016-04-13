//
//  ShopModel.m
//  自定义布局02
//
//  Created by Lawliet on 16/1/30.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#import "ShopModel.h"



@implementation ShopModel


- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)shopModelWithDic:(NSDictionary *)dic{
    return [[ShopModel alloc] initWithDic:dic];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"%@ : %@", key, value);
    
}
+ (NSMutableArray *)getDataFromPlist{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"1.plist" ofType:nil];
    NSMutableArray *array = [NSMutableArray arrayWithContentsOfFile:filePath];
    NSMutableArray *modelsArr = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        ShopModel *model = [ShopModel shopModelWithDic:dic];
        [modelsArr addObject:model];
    }
    return modelsArr;
}



@end
