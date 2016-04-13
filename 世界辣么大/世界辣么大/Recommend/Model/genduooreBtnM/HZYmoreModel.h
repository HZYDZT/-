//
//  HZYmoreModel.h
//  世界辣么大
//
//  Created by dllo on 16/3/4.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZYmoreModel : NSObject
@property (nonatomic ,retain) NSString *title;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *photo;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
