//
//  HZYCReusableView.m
//  世界辣么大
//
//  Created by dllo on 16/2/27.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYCReusableView.h"

@implementation HZYCReusableView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creat];
    }return self;
}
- (void)creat{
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 300, 30)];
    self.moreTitle = [UIButton buttonWithType:UIButtonTypeCustom];
   self.moreTitle.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 80, 0, 75, 30);
    [self.moreTitle setTitle:@"更多" forState:UIControlStateNormal];
    self.moreTitle.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.moreTitle setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    title.text = @"发现下一站";
    title.textColor = [UIColor grayColor];
    title.font = [UIFont systemFontOfSize:15];
    [self addSubview:title];
    [self addSubview:self.moreTitle];

}
@end
