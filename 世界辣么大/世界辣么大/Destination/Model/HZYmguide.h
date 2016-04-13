//
//  HZYmguide.h
//  世界辣么大
//
//  Created by dllo on 16/3/12.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZYmguide : NSObject
@property (nonatomic, retain) NSString *ID;
@property (nonatomic, retain) NSString *photo;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *user_id;
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *avatar;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
