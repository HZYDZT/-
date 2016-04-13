
//
//  HZYBtnModel.h
//  世界辣么大
//
//  Created by dllo on 16/2/27.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZYBtnModel : NSObject
@property (nonatomic, copy) NSString *cnname;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *pdf_count;
@property (nonatomic, copy) NSString *mobile_count;
@property (nonatomic, copy) NSString *pinyin;
@property (nonatomic, copy) NSString *enname;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
