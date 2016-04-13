//
//  HZYlastModel.h
//  世界辣么大
//
//  Created by dllo on 16/3/4.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZYlastModel : NSObject
@property (nonatomic ,retain) NSString *ID;
@property (nonatomic, retain) NSString *photo;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *lastpost;
@property (nonatomic, retain) NSString *user_id;
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *avatar;
@property (nonatomic, retain) NSString *replys;
@property (nonatomic, retain) NSString *likes;
@property (nonatomic, retain) NSString *view_url;
@property (nonatomic, retain) NSString *view_author_url;
@property (nonatomic, retain) NSString *views;
@property (nonatomic, retain) NSString *digest_level;
- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)lastModelDic:(NSDictionary *)dic;
@end
