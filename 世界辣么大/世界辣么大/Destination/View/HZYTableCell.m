//
//  HZYTableCell.m
//  世界辣么大
//
//  Created by dllo on 16/3/12.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYTableCell.h"

@implementation HZYTableCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creat];
    }return  self;
}
- (void)creat{
    self.img = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, self.contentView.frame.size.width / 2, 120)];
    self.lab = [[UILabel alloc] initWithFrame:CGRectMake(self.contentView.frame.size.width / 2 + 30, 15, 200 , 100)];
    self.lab.numberOfLines = 0;
   
    [self addSubview:self.img];
    [self addSubview:self.lab];
  
}

@end
