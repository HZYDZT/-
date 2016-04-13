//
//  HZYTwoCell.m
//  世界辣么大
//
//  Created by dllo on 16/2/27.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYTwoCell.h"

@implementation HZYTwoCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatItem];
    }return self;
}
- (void)creatItem{
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ([UIScreen mainScreen].bounds.size.width - 30 )/ 2, 100)];
    [self.contentView addSubview:self.imageView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 105, ([UIScreen mainScreen].bounds.size.width - 30) / 2, 45)];
    [self.contentView addSubview:self.titleLabel];
    
    self.priceOffLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 155, 50, 20)];
    [self.contentView addSubview:self.priceOffLabel];
    
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 30 )/ 2 - 80, 155, 50, 20)];
    self.priceLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.priceLabel];
    self.priceTlable = [[UILabel alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 30 )/ 2 - 30, 160, 45, 20)];
    self.priceTlable.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.priceTlable];

}
@end
