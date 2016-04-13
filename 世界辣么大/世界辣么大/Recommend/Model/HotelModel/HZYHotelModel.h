
//
//  HZYHotelModel.h
//  世界辣么大
//
//  Created by dllo on 16/3/9.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZYHotelModel : NSObject

@property (nonatomic, copy) NSString *cnname;

@property (nonatomic, copy) NSString *enname;

@property (nonatomic, copy) NSString *pinyin;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *is_hot;

@property (nonatomic, copy) NSString *photo;

@property (nonatomic, copy) NSString *lat;

@property (nonatomic, copy) NSString *lng;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
