//
//  HZYsearchTModel.h
//  世界辣么大
//
//  Created by dllo on 16/3/7.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZYsearchTModel : NSObject
@property (nonatomic, retain) NSString *qyerurl;

@property (nonatomic, assign) NSInteger beentocounts;

@property (nonatomic, copy) NSString  *ID;

@property (nonatomic, copy) NSString *englishname;

@property (nonatomic, assign) NSInteger commentcounts;

@property (nonatomic, copy) NSString *wayto;

@property (nonatomic, copy) NSString *address;

@property (nonatomic, copy) NSString *opentime;

@property (nonatomic, assign) NSInteger mapstatus;

@property (nonatomic, assign) NSInteger duration;

@property (nonatomic, assign) NSInteger planto;

@property (nonatomic, copy) NSString *photo;

@property (nonatomic, copy) NSString *cate_name;

@property (nonatomic, assign) NSInteger grade;

@property (nonatomic, assign) NSInteger recommendscores;

@property (nonatomic, copy) NSString *site;

@property (nonatomic, copy) NSString *introduction;

@property (nonatomic, assign) NSInteger beento;



@property (nonatomic, copy) NSString *localname;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, assign) NSInteger recommendnumber;



@property (nonatomic, copy) NSString *recommendstr;



@property (nonatomic, copy) NSString *firstname;

@property (nonatomic, copy) NSString *chinesename;

@property (nonatomic, assign) NSInteger city_id;

@property (nonatomic, assign) NSInteger cateid;

@property (nonatomic, copy) NSString *tips;

@property (nonatomic, assign) NSInteger updatetime;

@property (nonatomic, copy) NSString *secnodname;

@property (nonatomic, copy) NSString *phone;

@property (nonatomic, assign) NSInteger img_count;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
