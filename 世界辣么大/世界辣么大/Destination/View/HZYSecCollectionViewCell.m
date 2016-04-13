//
//  HZYSecCollectionViewCell.m
//  世界辣么大
//
//  Created by dllo on 16/3/7.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYSecCollectionViewCell.h"

@implementation HZYSecCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creat];
    }return self;
}
- (void)creat{
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ([UIScreen mainScreen].bounds.size.width - 30) / 2, 40)];
    self.label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, ([UIScreen mainScreen].bounds.size.width - 30) / 2, 40)];
    
    self.label.textAlignment = 1;
    self.label2.textAlignment = 1;
    self.label.backgroundColor = [UIColor whiteColor];
    self.label2.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.label2];
    [self addSubview:self.label];


}
@end
