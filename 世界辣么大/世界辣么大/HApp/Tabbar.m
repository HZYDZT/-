//
//  Tabbar.m
//  世界辣么大
//
//  Created by dllo on 16/2/24.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "Tabbar.h"

@interface Tabbar ()

@end

@implementation Tabbar

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.alpha = 0.7;
    self.tabBar.barTintColor= [UIColor blackColor];
    RecommendVC *Rvc = [[RecommendVC alloc] init];
    DestinationVC *Dvc = [[DestinationVC alloc] init];
    CommunityVC *Cvc = [[CommunityVC alloc] init];
    MineVC *Mvc = [[MineVC alloc] init];
    self.tabBar.backgroundColor = [UIColor whiteColor];
    [self addChildVC:Rvc Title:@"推荐" Image:@"tuijian.png" SeleImage:@"tuijian1.png"];
    [self addChildVC:Dvc Title:@"目的地" Image:@"faxian.png" SeleImage:@"faxian1.png"];
    [self addChildVC:Cvc Title:@"社区" Image:@"shequ.png" SeleImage:@"shequ1.png"];
    [self addChildVC:Mvc Title:@"我的" Image:@"wode.png" SeleImage:@"wode1.png"];
}
- (void)addChildVC:(UIViewController *)ChildVC
             Title:(NSString *)title
             Image:(NSString *)image
         SeleImage:(NSString *)seleimage{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:ChildVC];
    ChildVC.tabBarController.tabBar.translucent = NO;
    ChildVC.navigationController.navigationBar.translucent = NO;
    ChildVC.navigationController.navigationBar.backgroundColor = [UIColor orangeColor];
    ChildVC.tabBarItem.title = title;
    ChildVC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    ChildVC.tabBarItem.selectedImage = [[UIImage imageNamed:seleimage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName] = [UIColor cyanColor];
    [ChildVC.tabBarItem setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    NSMutableDictionary *dicT = [NSMutableDictionary dictionary];
    dicT[NSForegroundColorAttributeName] = [UIColor redColor];
    [ChildVC.tabBarItem setTitleTextAttributes:dicT forState:UIControlStateSelected];
    //层级关系 tabbar 控制导航控制器 控制VC
    [self addChildViewController:nav];
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
