//
//  HZYWebController.m
//  世界辣么大
//
//  Created by dllo on 16/2/27.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYWebController.h"
#import "MineVC.h"
#import "SqliteFmdbTool.h"
#import "FMDB.h"
@interface HZYWebController ()
@property (nonatomic, retain) UIWebView *webView;
@end

@implementation HZYWebController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *itrm = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"fan4.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = itrm;
    self.navigationItem.title = self.code.title;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"40-inbox.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(add)];
    self.navigationItem.rightBarButtonItem = rightItem;
    [self creat];
    
    
}
- (void)add{
    BOOL result = YES;
    NSArray *array = [SqliteFmdbTool seleStudent];//搜索
    for (HZYpriceModel *model in array) {
        if ([self.model.title isEqualToString:model.title]) {
            result = NO;
            break;
        }
    }
    if (result) {
        
        [self shoucang];
    } else {
        [self bushoucang];
    }
    
}
- (void)shoucang{
    NSString *title = @"提示";
    NSString *message = @"收藏成功";
    NSString *cancelButtonTitle = @"确定";
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
    [SqliteFmdbTool addStudent:self.model mod:self.genduoMod];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"aada" object:nil];
}
- (void)bushoucang{
    NSString *title = @"提示";
    NSString *message = @"收藏失败";
    NSString *cancelButtonTitle = @"确定";
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
- (void)creat{
    NSString *str = @"";
    NSString *string =  [NSString stringWithFormat:@"http://m.qyer.com/z/deal/%@/?source=app&client_id=qyer_ios&track_app_version=6.8.4&track_deviceid=F1CC1DC7-CC07-473E-BE71-407A9CED5975",self.model.ID];
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    if (self.code.url) {
       str = self.code.url;
    }else if(self.model.ID){
       str = string;
    }else {
       str = self.genduoMod.url;
    }
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
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
