
//
//  HZYThreeReusableView.m
//  世界辣么大
//
//  Created by dllo on 16/3/8.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYThreeReusableView.h"

@implementation HZYThreeReusableView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creat];
    }return self;

}
- (void)creat{
    self.backLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 120, 60)];
//    self.backLabel.backgroundColor = [UIColor redColor];
    [self addSubview:self.backLabel];


}
@end
