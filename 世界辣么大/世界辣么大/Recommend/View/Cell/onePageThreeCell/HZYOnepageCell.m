
//
//  HZYOnepageCell.m
//  世界辣么大
//
//  Created by dllo on 16/3/4.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYOnepageCell.h"

@implementation HZYOnepageCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creat];
    }return self;
}
- (void)creat{
    self.imgbView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, ([UIScreen mainScreen].bounds.size.width - 30) / 2 / 3 * 2, 150)];
    self.imgbView.backgroundColor = [UIColor redColor];
    [self addSubview:self.imgbView];
    self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 30) / 2 / 3 * 2 + 5, 40, ([UIScreen mainScreen].bounds.size.width - 30) / 2 / 3 - 5, 150)];
    self.label1.numberOfLines = 0;
    self.label1.textAlignment = NSTextAlignmentNatural;
    self.label1.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.label1];

}

@end
