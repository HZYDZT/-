//
//  HZYtitleRView.m
//  世界辣么大
//
//  Created by dllo on 16/3/3.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYtitleRView.h"

@implementation HZYtitleRView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.labela = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
        self.labela.textColor = [UIColor grayColor];
        self.labela.font = [UIFont systemFontOfSize:15];
        [self addSubview:self.labela];
    }return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
 self.labela.frame = CGRectMake(15, 0, 100 , 30);
}
@end
