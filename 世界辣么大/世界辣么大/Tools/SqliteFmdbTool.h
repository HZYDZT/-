//
//  SqliteFmdbTool.h
//  UI_21FMDB
//
//  Created by dllo on 16/1/20.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HZYpriceModel.h"
#import "HZYgenduoModel.h"
@interface SqliteFmdbTool : NSObject
+ (NSMutableArray *)seleStudent;
+ (void)deleteHeadModel:(HZYpriceModel *)model
                    mod:(HZYgenduoModel *)mod;
+ (void)addStudent:(HZYpriceModel *)model
               mod:(HZYgenduoModel *)mod;
@end
