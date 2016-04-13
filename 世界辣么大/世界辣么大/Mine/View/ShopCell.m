//
//  ShopCell.m
//  世界辣么大
//
//  Created by dllo on 16/3/16.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "ShopCell.h"

@implementation ShopCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }return self;
}
- (void)layoutSubviews{
    self.imaga = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 137, 240)];
    [self addSubview:self.imaga];
}
@end
