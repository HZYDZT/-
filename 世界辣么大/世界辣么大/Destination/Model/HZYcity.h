//
//  HZYcity.h
//  世界辣么大
//
//  Created by dllo on 16/3/12.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZYcity : NSObject
@property (nonatomic, retain) NSString *ID;
@property (nonatomic, retain) NSString *enname;
@property (nonatomic, retain) NSString *cnname;
@property (nonatomic, retain) NSString *photo;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
