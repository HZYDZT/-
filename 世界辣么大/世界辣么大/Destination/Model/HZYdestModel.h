
//
//  HZYdestModel.h
//  世界辣么大
//
//  Created by dllo on 16/2/29.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZYdestModel : NSObject
@property (nonatomic, copy) NSString *cnname;
@property (nonatomic, copy) NSString *enname;
@property (nonatomic, retain) NSString *ID;
@property (nonatomic, retain) NSMutableArray *hotArr;
@property (nonatomic, retain) NSMutableArray *country;
+(instancetype)destModelWithDic:(NSDictionary*)dic;

@end
