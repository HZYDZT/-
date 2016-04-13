//
//  ShopModel.h
//  自定义布局02
//
//  Created by Lawliet on 16/1/30.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ShopModel : NSObject

@property (nonatomic, assign)  CGFloat W;
@property (nonatomic, assign) CGFloat H;
@property (nonatomic, copy) NSString *img;
@property (nonatomic, copy) NSString *price;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)shopModelWithDic:(NSDictionary *)dic;

+ (NSMutableArray *)getDataFromPlist;


@end


