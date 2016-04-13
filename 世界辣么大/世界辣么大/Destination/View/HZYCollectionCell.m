//
//  HZYCollectionCell.m
//  世界辣么大
//
//  Created by dllo on 16/3/7.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYCollectionCell.h"

@implementation HZYCollectionCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creat];
    }return self;
}
- (void)creat{
    self.imag = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ([UIScreen mainScreen].bounds.size.width - 30) / 2, 240)];
    self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 300, 50)];
    self.label1.backgroundColor = [UIColor clearColor];
    self.label1.textColor = [UIColor purpleColor];
    [self.imag addSubview:self.label1];
    [self addSubview:self.imag];
}

@end
