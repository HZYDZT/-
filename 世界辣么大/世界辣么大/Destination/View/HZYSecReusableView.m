//
//  HZYSecReusableView.m
//  世界辣么大
//
//  Created by dllo on 16/3/7.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYSecReusableView.h"

@implementation HZYSecReusableView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creat];
    }return self;
}
- (void)creat{
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 240)];
    self.imageView.image = [UIImage imageNamed:@"map.jpg"];
    self.imageView.userInteractionEnabled = YES;
    [self addSubview:self.imageView];
    
    self.asia = [UIButton buttonWithType:UIButtonTypeCustom];
    self.asia.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.77, 50, 60, 30);
    self.asia.backgroundColor = [UIColor redColor];
    self.asia.tag = 1001;
    [self.asia setTitle:@"亚洲" forState:UIControlStateNormal];
    [self.asia setTitle:@"~~" forState:UIControlStateHighlighted];
    [self.imageView addSubview:self.asia];
    
    self.northAmerica  = [UIButton buttonWithType:UIButtonTypeCustom];
    self.northAmerica.frame = CGRectMake(0.1 * [UIScreen mainScreen].bounds.size.width, 40, 60, 30);
    self.northAmerica.backgroundColor = [UIColor purpleColor];
    self.northAmerica.tag = 1003;
    [self.northAmerica setTitle:@"北美洲" forState:UIControlStateNormal];
    [self.imageView addSubview:self.northAmerica];
    
    self.southAmerica = [UIButton buttonWithType:UIButtonTypeCustom];
    self.southAmerica.frame = CGRectMake(0.2 * [UIScreen mainScreen].bounds.size.width, 120, 60, 30);
    self.southAmerica.backgroundColor = [UIColor orangeColor];
    self.southAmerica.tag = 1004;
    [self.southAmerica setTitle:@"南美洲" forState:UIControlStateNormal];
    [self.southAmerica setTitle:@"~~" forState:UIControlStateHighlighted];
    [self.imageView addSubview:self.southAmerica];
    
    self.europe = [UIButton buttonWithType:UIButtonTypeCustom];
    self.europe.frame = CGRectMake(0.55 * [UIScreen mainScreen].bounds.size.width, 40, 60, 30);
    self.europe.backgroundColor = [UIColor blackColor];
    self.europe.tag = 1002;
    [self.europe setTitle:@"欧洲" forState:UIControlStateNormal];
    [self.europe setTitle:@"~~" forState:UIControlStateHighlighted];
    [self.imageView addSubview:self.europe];
    
    self.africa = [UIButton buttonWithType:UIButtonTypeCustom];
    self.africa.tag = 1006;
    self.africa.frame = CGRectMake(0.48 * [UIScreen mainScreen].bounds.size.width, 110, 60, 30);
    self.africa.backgroundColor = [UIColor cyanColor];
    [self.africa setTitle:@"非洲" forState:UIControlStateNormal];
    [self.africa setTitle:@"~~" forState:UIControlStateHighlighted];
    [self.imageView addSubview:self.africa];
    
    
    
    self.oceania = [UIButton buttonWithType:UIButtonTypeCustom];
    self.oceania.frame = CGRectMake(0.84 * [UIScreen mainScreen].bounds.size.width, 130, 60, 30);
   self.oceania.tag = 1005;
    self.oceania.backgroundColor = [UIColor greenColor];
    [self.oceania setTitle:@"大洋洲" forState:UIControlStateNormal];
    [self.oceania setTitle:@"~~" forState:UIControlStateHighlighted];
    [self.imageView addSubview:self.oceania];
    
    self.antarctica = [UIButton buttonWithType:UIButtonTypeCustom];
    self.antarctica.frame = CGRectMake(0.72 * [UIScreen mainScreen].bounds.size.width, 190, 60, 30);
    self.antarctica.tag = 1007;
    self.antarctica.backgroundColor = [UIColor blueColor];
    [self.antarctica setTitle:@"南极洲" forState:UIControlStateNormal];
    [self.antarctica setTitle:@"~~" forState:UIControlStateHighlighted];
    [self.imageView addSubview:self.antarctica];

}

@end
