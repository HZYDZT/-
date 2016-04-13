//
//  HZYHotelCollectionViewCell.m
//  世界辣么大
//
//  Created by dllo on 16/3/9.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYHotelCollectionViewCell.h"

@implementation HZYHotelCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creat];
    }return self;
}
- (void)creat{
    self.imagv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ([UIScreen mainScreen].bounds.size.width - 20)/3, ([UIScreen mainScreen].bounds.size.height - 49 - 64 - 26)/3)];
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, 60, 40)];
    [self.imagv addSubview:self.label];
    [self addSubview:self.imagv];
}
@end
