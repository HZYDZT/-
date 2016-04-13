//
//  HZYlastController.m
//  世界辣么大
//
//  Created by dllo on 16/3/4.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYlastController.h"

@interface HZYlastController ()
@property (nonatomic, retain) UIWebView *webView;
@end

@implementation HZYlastController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *itrm = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"fan2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = itrm;
    [self creat];
    
    
}
- (void)creat{
    
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    NSURL *url = [NSURL URLWithString:self.sr];
    NSURLRequest *requset = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requset];
    [self.view addSubview:self.webView];



}
- (void)back{
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }else{
        [self.navigationController popToRootViewControllerAnimated:YES];
    }

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
