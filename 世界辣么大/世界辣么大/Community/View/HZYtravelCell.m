//
//  HZYtravelCell.m
//  世界辣么大
//
//  Created by dllo on 16/3/1.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYtravelCell.h"

@implementation HZYtravelCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creat];
    }return  self;
}
- (void)creat{
    self.img = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 100, 120)];
    [self.contentView addSubview:self.img];
    self.title = [[UILabel alloc] initWithFrame:CGRectMake(120, 10, [UIScreen mainScreen].bounds.size.width - 120, 30)];
    [self.contentView addSubview:self.title];
    self.digest = [[UILabel alloc] initWithFrame:CGRectMake(120, 50, [UIScreen mainScreen].bounds.size.width - 120, 70)];
    self.digest.numberOfLines = 0;
    self.digest.font = [UIFont systemFontOfSize:14];
    self.digest.textColor = [UIColor grayColor];
    [self.contentView addSubview:self.digest];
}
@end
