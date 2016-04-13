//
//  HZYHollectionReusableView.m
//  世界辣么大
//
//  Created by dllo on 16/2/27.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYHollectionReusableView.h"

@implementation HZYHollectionReusableView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
//        self.Zview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//        [self addSubview:self.Zview];

        [self creat];
    }return self;
}
- (void)creat{

    UILabel *labe = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 400, 30)];
    labe.text = @"抢特价~~~";
    labe.textColor = [UIColor grayColor];
    labe.font = [UIFont systemFontOfSize:15];
    self.genduo = [UIButton buttonWithType:UIButtonTypeCustom];
    self.genduo.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 80, 0, 75, 30);
    [self.genduo setTitle:@"更多" forState:UIControlStateNormal];
    self.genduo.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.genduo setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    UIImageView * imageViewThree = [[UIImageView alloc] initWithFrame:CGRectMake(5, 30,[UIScreen mainScreen].bounds.size.width - 10 , 170)];
    [imageViewThree sd_setImageWithURL:[NSURL URLWithString:@"http://pic.qyer.com/public/mobileapp/homesubject/2016/01/18/14531027186613/w800"]];
    imageViewThree.userInteractionEnabled = YES;
    [self addSubview:imageViewThree];

    
    [self addSubview:labe];
    [self addSubview:self.genduo];
}
//- (void)layoutSubviews{
//    [super layoutSubviews];
//    self.Zview.frame = CGRectMake(0, 0, 414, 200);
//}
@end
