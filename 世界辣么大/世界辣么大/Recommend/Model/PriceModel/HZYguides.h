//
//  HZYguides.h
//  世界辣么大
//
//  Created by dllo on 16/3/3.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZYguides : NSObject
@property (nonatomic, copy) NSString *category_title;
@property (nonatomic, copy) NSString *country_name_py;
@property (nonatomic, copy) NSString *country_id;
@property (nonatomic, copy) NSString *guide_id;
@property (nonatomic, copy) NSString *category_id;
@property (nonatomic, copy) NSString *file;
@property (nonatomic, copy) NSString *guide_enname;
@property (nonatomic, copy) NSString *country_name_en;
@property (nonatomic, copy) NSString *size;
@property (nonatomic, copy) NSString *country_name_cn;
@property (nonatomic, copy) NSString *download;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *cover;
@property (nonatomic, copy) NSString *update_log;
@property (nonatomic, copy) NSString *guide_cnname;
@property (nonatomic, copy) NSString *guide_pinyin;
@property (nonatomic, copy) NSString *cover_updatetime;
@property (nonatomic, copy) NSString *update_time;
- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)guidesWithDic:(NSDictionary *)dic;
@end
