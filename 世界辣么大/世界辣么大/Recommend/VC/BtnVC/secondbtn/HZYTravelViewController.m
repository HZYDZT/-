//
//  HZYTravelViewController.m
//  世界辣么大
//
//  Created by dllo on 16/3/8.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYTravelViewController.h"
#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height
@interface HZYTravelViewController ()<UIScrollViewDelegate>

@end

@implementation HZYTravelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"gg.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStylePlain target:self action:@selector(GG)];
    self.navigationItem.leftBarButtonItem = item;
    self.navigationItem.title = @"带着心去旅行~~~~";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor cyanColor],NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    [self creat];
}
- (void)GG{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)creat{
    UIScrollView *scr = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    scr.contentSize = CGSizeMake(WIDTH * 10, HEIGHT - 49 - 64);
    for (int i = 1; i < 11; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH * (i - 1), 0, WIDTH, HEIGHT - 49 - 64)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"ly%d.jpg",i]];
        [scr addSubview:imageView];
    }
    scr.pagingEnabled = YES;
    [self.view addSubview:scr];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
