//
//  HZYReusableView.m
//  世界辣么大
//
//  Created by dllo on 16/2/26.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYReusableView.h"

@implementation HZYReusableView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creat];
    }return self;

}
- (NSMutableArray *)BtnArray{
    if (_BtnArray == nil) {
        _BtnArray = [NSMutableArray array];
    }return _BtnArray;
}
- (void)creat{
    UIView *viewT = [[UIView alloc] initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 100)];
    self.btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 10, 60, 60)];
    self.btn2 = [[UIButton alloc] initWithFrame:CGRectMake(80 + ([UIScreen mainScreen].bounds.size.width - 280)/ 3, 10, 60, 60)];
    self.btn3 = [[UIButton alloc] initWithFrame:CGRectMake(140 + ([UIScreen mainScreen].bounds.size.width - 280)/ 3 * 2, 10, 60, 60)];
    self.btn4 = [[UIButton alloc] initWithFrame:CGRectMake(200 + [UIScreen mainScreen].bounds.size.width - 280, 10, 60, 60)];
    [self.btn setImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
    [self.btn2 setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
    [self.btn3 setImage:[UIImage imageNamed:@"3.png"] forState:UIControlStateNormal];
    [self.btn4 setImage:[UIImage imageNamed:@"4.png"] forState:UIControlStateNormal];
    self.BtnArray = [@[@"看钱包", @"看风景", @"看酒店", @"旅途中"] mutableCopy];
    for (int i = 0; i < 4; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30 + (60 + ([UIScreen mainScreen].bounds.size.width - 280) / 3) * i, 75, 60, 20)];
        label.text = self.BtnArray[i];
        label.font = [UIFont systemFontOfSize:14];
        [viewT addSubview:label];
    }
    [viewT addSubview:self.btn];
    [viewT addSubview:self.btn2];
    [viewT addSubview:self.btn3];
    [viewT addSubview:self.btn4];
    [self addSubview:viewT];
}

@end
