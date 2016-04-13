
//
//  HZYtravelModel.h
//  世界辣么大
//
//  Created by dllo on 16/3/1.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZYtravelModel : NSObject
@property (nonatomic, copy) NSString *digest;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imgsrc;

@property (nonatomic, copy) NSString *url_3w;
@property (nonatomic, copy) NSString *ltitle;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *postid;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *priority;
@property (nonatomic, assign) NSInteger votecount;
@property (nonatomic, copy) NSString *lmodify;
@property (nonatomic, copy) NSString *docid;
@property (nonatomic, copy) NSString *boardid;
@property (nonatomic, copy) NSString *ptime;
@property (nonatomic, assign) NSInteger replyCount;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
