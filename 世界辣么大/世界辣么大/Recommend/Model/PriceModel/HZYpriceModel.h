//
//  HZYpriceModel.h
//  世界辣么大
//
//  Created by dllo on 16/2/27.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZYpriceModel : NSObject
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *price;
@property (nonatomic, retain) NSString *priceoff;
@property (nonatomic, retain) NSString *end_data;
@property (nonatomic, retain) NSString *photo;
@property (nonatomic, retain) NSString *ID;
- (instancetype)initWithDic:(NSDictionary *)dic;

@end
