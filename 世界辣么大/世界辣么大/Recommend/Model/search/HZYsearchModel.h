//
//  HZYsearchModel.h
//  世界辣么大
//
//  Created by dllo on 16/3/7.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZYsearchModel : NSObject
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *label;
@property (nonatomic, copy) NSString *beennumber;
@property (nonatomic, copy) NSString *parentid;
@property (nonatomic, copy) NSString *parent_parentname;
@property (nonatomic, copy) NSString *beenstr;
@property (nonatomic, copy) NSString *has_mguide;
@property (nonatomic, copy) NSString *enname;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *parentname;
@property (nonatomic, copy) NSString *cnname;
@property (nonatomic, copy) NSString *grade;
@property (nonatomic, copy) NSString *photo;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
