//
//  HZYBtnCell.m
//  世界辣么大
//
//  Created by dllo on 16/3/3.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYBtnCell.h"

@implementation HZYBtnCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creat];
    }return self;
}
- (void)creat{
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 140, 200)];
    self.imageView.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.imageView];
}
@end
