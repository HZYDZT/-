
//
//  HZYgenduoCollectionViewCell.m
//  世界辣么大
//
//  Created by dllo on 16/3/5.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYgenduoCollectionViewCell.h"

@implementation HZYgenduoCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creat];
    }return self;
}
- (void)creat{
    self.imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ([UIScreen mainScreen].bounds.size.width - 35 ) / 2, 120)];
    self.imageview.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.imageview];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 130 , ([UIScreen mainScreen].bounds.size.width - 35 ) / 2, 50)];
    self.titleLabel.backgroundColor = [UIColor whiteColor];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.textAlignment = YES;
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.titleLabel];
    
    self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 185, ([UIScreen mainScreen].bounds.size.width - 35 ) / 2, 20)];
    self.dateLabel.font = [UIFont systemFontOfSize:13];
    self.dateLabel.textColor = [UIColor grayColor];
    [self addSubview:self.dateLabel];
    self.lowLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 205, 80, 30)];
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 35 ) / 2 - 80, 205, 70, 30)];
    self.priceLabel.textAlignment = NSTextAlignmentRight;
    self.lowLabel.font = [UIFont systemFontOfSize:13];
    self.priceLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.lowLabel];
    [self addSubview:self.priceLabel];
    
    
    
    
}


@end
