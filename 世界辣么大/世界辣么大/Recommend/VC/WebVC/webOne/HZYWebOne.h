//
//  HZYWebOne.h
//  世界辣么大
//
//  Created by dllo on 16/3/2.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideModel.h"
#import "HZYpriceModel.h"
#import "HZYsearchTModel.h"
@interface HZYWebOne : UIViewController
@property (nonatomic, retain) SlideModel *code;
@property (nonatomic, retain) HZYpriceModel *model;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *mod;
@property (nonatomic, retain) NSString *link;
//@property (nonatomic, retain) HZYsearchTModel *modell;
@end
