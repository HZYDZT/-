//
//  HZYdestChildModel.h
//  世界辣么大
//
//  Created by dllo on 16/3/18.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZYdestChildModel : NSObject

@property (nonatomic, retain) NSNumber *ID;

@property (nonatomic, retain) NSString  *cnname;

@property (nonatomic, retain) NSString *enname;

@property (nonatomic, retain) NSString *photo;

@property (nonatomic, retain) NSNumber *count;

@property (nonatomic, retain) NSString *label;

@property (nonatomic, retain) NSNumber *flag;


+(instancetype)childModelWithDic:(NSDictionary*)dic;

@end
