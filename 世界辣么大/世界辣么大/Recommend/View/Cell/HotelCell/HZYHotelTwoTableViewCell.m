//
//  HZYHotelTwoTableViewCell.m
//  世界辣么大
//
//  Created by dllo on 16/3/9.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYHotelTwoTableViewCell.h"

@implementation HZYHotelTwoTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creat];
    }return self;
}
- (void)creat{
    self.imagV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, [UIScreen mainScreen].bounds.size.width * 0.33, 0.13 * [UIScreen mainScreen].bounds.size.height)];
    [self addSubview:self.imagV];
    
    self.label1 = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * 0.33 + 20, 5, [UIScreen mainScreen].bounds.size.width * 0.33, 25)];
    [self addSubview:self.label1];
    
    
    
    self.label2 = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * 0.33 + 20, 32, [UIScreen mainScreen].bounds.size.width * 0.33 , 24)];
    [self addSubview:self.label2];
    
    
    self.imag = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * 0.33 + 20, 80, 15, 15)];
    [self addSubview:self.imag];
    
    self.label3 = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * 0.33 + 20, 58 , 80, 20)];
    [self addSubview:self.label3];
    self.label4 = [[UILabel alloc] initWithFrame:CGRectMake(180, 80, 140, 15)];
    [self addSubview:self.label4];
    self.label5 = [[UILabel alloc] initWithFrame:CGRectMake(0.83 * [UIScreen mainScreen].bounds.size.width, 5, 60, 25)];
    [self addSubview:self.label5];
    self.label6 = [[UILabel alloc] initWithFrame:CGRectMake(0.65 * [UIScreen mainScreen].bounds.size.width, 50, 110, 30)];
    [self addSubview:self.label6];
}
@end
