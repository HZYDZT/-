//
//  HZYCollectionViewCell.m
//  世界辣么大
//
//  Created by dllo on 16/2/26.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYCollectionViewCell.h"

@implementation HZYCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatCell];
    }return self;
}
- (void)creatCell{
    self.picImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ([UIScreen mainScreen].bounds.size.width - 30) / 2, 100)];
    [self addSubview:self.picImageView];

}
@end
