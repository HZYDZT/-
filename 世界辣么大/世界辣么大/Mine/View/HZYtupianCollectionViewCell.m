//
//  HZYtupianCollectionViewCell.m
//  世界辣么大
//
//  Created by dllo on 16/3/16.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYtupianCollectionViewCell.h"

@implementation HZYtupianCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }return self;
}
- (void)layoutSubviews{
    self.imag = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self addSubview:self.imag];

}


@end
