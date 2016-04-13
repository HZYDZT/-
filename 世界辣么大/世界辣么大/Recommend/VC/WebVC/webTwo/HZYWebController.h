//
//  HZYWebController.h
//  世界辣么大
//
//  Created by dllo on 16/2/27.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideModel.h"
#import "HZYpriceModel.h"
#import "HZYgenduoModel.h"
@interface HZYWebController : UIViewController
@property (nonatomic, retain) SlideModel *code;
@property (nonatomic, retain) HZYpriceModel *model;
@property (nonatomic, retain) HZYgenduoModel *genduoMod;
@end
