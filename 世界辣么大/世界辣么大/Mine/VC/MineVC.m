//
//  MineVC.m
//  世界辣么大
//
//  Created by dllo on 16/2/25.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "MineVC.h"
#import "MineTwoVc.h"
#import <UIImageView+WebCache.h>
#import "HZYDituViewController.h"
#define width self.view.frame.size.width
#define Height self.view.frame.size.height
@interface MineVC ()
@property (nonatomic ,retain) UIImageView *img;
@end

@implementation MineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"32.jpg"]];
    self.img.frame = CGRectMake(0, -400, width, 400);
    self.tableView.contentInset =  UIEdgeInsetsMake(200, 0, 0, 0);
    self.img.contentMode = UIViewContentModeScaleAspectFill;
    [self.tableView insertSubview:self.img atIndex:0];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat down = (ABS(scrollView.contentOffset.y))  - 200 ;
    if (down < 0) {
        return;
    }
    CGRect rect = self.img.frame;
    rect.size.height = 500 + down;
    self.img.frame = rect;
//    NSLog(@"%.2f", scrollView.contentOffset.y);
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"收藏";
        cell.backgroundColor = [UIColor colorWithRed:255/255.0 green:202/255.0 blue:158/255.0 alpha:1.0];
        cell.imageView.image = [UIImage imageNamed:@"53-house.png"];
    }else if (indexPath.row == 1){
       
    }else if(indexPath.row == 2){
        cell.textLabel.text = @"清除缓存";
        cell.backgroundColor = [UIColor colorWithRed:144/255.0 green:204/255.0 blue:157/255.0 alpha:1.0];
        cell.imageView.image = [UIImage imageNamed:@"tshirt.png"];
    }else if(indexPath.row == 3){
        cell.textLabel.text = @"我们";
        cell.backgroundColor = [UIColor colorWithRed:104/255.0 green:144/255.0 blue:157/255.0 alpha:1.0];
        cell.imageView.image = [UIImage imageNamed:@"tshirt.png"];
    }
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        MineTwoVc *VC = [[MineTwoVc alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
    }else if (indexPath.row == 1){
        
      
    }else if (indexPath.row == 2){
        SDImageCache * sd = [SDImageCache sharedImageCache];
        float size = [sd getSize] /1024.0 /1024.0;
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"清除缓存" message:[NSString stringWithFormat:@"当前缓存为%.2fMB",size] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [sd clearDisk];
        }];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
        }];
        [alert addAction:okAction];
        [alert addAction:cancelAction];
       
    [self  presentViewController:alert animated:YES completion:nil];
    }else if(indexPath.row == 3){
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"旅游的意义" message:@"让我们一起旅行吧~~" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        }];
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:^{
        }];
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
