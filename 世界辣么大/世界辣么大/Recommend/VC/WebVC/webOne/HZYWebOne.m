//
//  HZYWebOne.m
//  世界辣么大
//
//  Created by dllo on 16/3/2.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYWebOne.h"
#import "HZYNetWorkTool.h"
@interface HZYWebOne ()
@property (nonatomic ,retain) UIWebView *webView;
@end

@implementation HZYWebOne

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *itrm = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"fan3.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = itrm;
    [self creat];
}
- (void)creat{
    NSString *str = @"";
    NSString *string =  [NSString stringWithFormat:@"http://m.qyer.com/z/deal/%@/?source=app&client_id=qyer_ios&track_app_version=6.8.4&track_deviceid=F1CC1DC7-CC07-473E-BE71-407A9CED5975",self.model.ID];
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    if (self.code.url) {//轮播图
        str = self.code.url;
    }else if (self.url){//发现下一站的更多
        str = self.url;
    }else if(self.mod){//抢特价
        str = self.mod;
    }else if(self.link){//订酒店
        str = self.link;
    }else{
        str = string;
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
