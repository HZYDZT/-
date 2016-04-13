//
//  HZYCellVc.m
//  世界辣么大
//
//  Created by dllo on 16/3/4.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYCellVc.h"
#import "UMSocial.h"
@interface HZYCellVc ()<UMSocialUIDelegate>
@property (nonatomic, retain) UIWebView *webView;
@property (nonatomic, retain) UIAlertController *alertVC;
@end

@implementation HZYCellVc

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(btnShareClick)];
    self.navigationItem.rightBarButtonItem = item;
    [self creat];
}
- (void)creat{
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    NSString *string = self.str;
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *requset = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requset];
    [self.view addSubview:self.webView];
}
- (void)btnShareClick{
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"56e3ccc9e0f55ada370013cd"
                                      shareText:self.title
                                     shareImage:[UIImage imageNamed:self.imgscr]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToTencent,nil]
                                       delegate:self];
    

}

//弹出列表方法presentSnsIconSheetView需要设置delegate为self
-(BOOL)isDirectShareInIconActionSheet
{
    return YES;
}
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的微博平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
        
        self.alertVC = [UIAlertController alertControllerWithTitle:self.title message:@"分享成功" preferredStyle:1];
        [self presentViewController:self.alertVC animated:YES completion:^{
            
            
        }];
        [self performSelector:@selector(alertDismiss)withObject:self.alertVC afterDelay:2];
        
        
        
    }
}

- (void)alertDismiss{
    
    [self.alertVC dismissViewControllerAnimated:YES completion:^{
        
        
    }];
    
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

@end
