
//
//  HZYtextViewController.m
//  世界辣么大
//
//  Created by dllo on 16/3/11.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYtextViewController.h"
#import "HZYhotelViewController.h"
#define  WIDTH  self.view.frame.size.width
#define  HEIGHT self.view.frame.size.height
@interface HZYtextViewController ()
@property (nonatomic, assign) int i1;
@property (nonatomic, assign) int i2;
@property (nonatomic, assign) int i3;
@property (nonatomic, assign) int i4;
@end

@implementation HZYtextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"fan1.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStylePlain target:self action:@selector(GG)];
    self.navigationItem.leftBarButtonItem = item;
    // Do any additional setup after loading the view.
    [self creat];
}
- (void)creat{
    UIImageView *img = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    img.image = [UIImage imageNamed:@"textback.jpg"];
    [self.view addSubview:img];
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake((WIDTH - 300) / 2, (HEIGHT - 200 - 49 - 64) / 2, 300, 200)];
    backView.backgroundColor = [UIColor whiteColor];
    UILabel *intack = [[UILabel alloc] initWithFrame:CGRectMake(15, 30, 112, 25)];
    intack.text = @"入住日期";
    intack.textAlignment = NSTextAlignmentCenter;
    UILabel *outtack = [[UILabel alloc] initWithFrame:CGRectMake(165, 30, 112, 25)];
    outtack.text = @"离开日期";
    outtack.textAlignment = NSTextAlignmentCenter;
    [backView addSubview:outtack];
    [backView addSubview:intack];
    self.field = [[UITextField alloc] initWithFrame:CGRectMake((300 - 150 - 120) / 2, 60, 40, 30)];
    self.field.layer.borderColor = [[UIColor grayColor] CGColor];
    self.field.layer.borderWidth = 1;
    self.field.layer.cornerRadius = 8;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(56, 60, 30, 30)];
    label.text = @"月";
    label.textAlignment = NSTextAlignmentCenter;
    self.field1 = [[UITextField alloc] initWithFrame:CGRectMake(87, 60, 40, 30)];
    self.field1.layer.borderWidth = 1;
    self.field1.layer.borderColor = [[UIColor grayColor] CGColor];
    self.field1.layer.cornerRadius = 8;
    self.field2 = [[UITextField alloc] initWithFrame:CGRectMake(165, 60, 40, 30)];
    self.field2.layer.borderWidth = 1;
    self.field2.layer.cornerRadius = 8;
    self.field2.layer.borderColor = [[UIColor grayColor] CGColor];
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(206, 60, 30, 30)];
    lab.text = @"月";
    lab.textAlignment = NSTextAlignmentCenter;
    self.field3 = [[UITextField alloc] initWithFrame:CGRectMake(237, 60, 40, 30)];
    self.field3.layer.borderWidth = 1;
    self.field3.layer.cornerRadius = 8;
    self.field3.layer.borderColor = [[UIColor grayColor] CGColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(80, 130, 140, 40);
    btn.layer.borderWidth = 1;
    btn.layer.cornerRadius = 10;
    [btn setTitle:@"查  询" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backView addSubview:btn];
    [btn addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:self.field3];
    [backView addSubview:lab];
    [backView addSubview:self.field2];
    [backView addSubview:self.field1];
    [backView addSubview:label];
    [backView addSubview:self.field];
    [self.view addSubview:backView];

}
- (void)GG{
    [self.navigationController popToRootViewControllerAnimated:YES];

}
- (void)jump{
    self.i1 = [self.field.text intValue];
    self.i2 = [self.field1.text intValue];
    self.i3 = [self.field2.text intValue];
    self.i4 = [self.field3.text intValue];
    BOOL result1 = self.i1 < 13 && self.i1 <= self.i3;
    BOOL result2 = self.i3 < 13;
    BOOL result3 = (self.i1 == 2 && self.i2 < 30) || (self.i1 != 2 && self.i2 % 2 != 0 && self.i2 < 32)||(self.i1 != 2 && self.i2 % 2 == 0 && self.i2 < 31);
    BOOL result4 = (self.i3 == 2 && self.i4 < 30) || (self.i3 != 2 && self.i4 % 2 != 0 && self.i4 < 32)||(self.i3 != 2 && self.i4 % 2 == 0 && self.i4 < 31);
    BOOL result5 = (self.i1 == self.i3 && self.i2 < self.i4) || (self.i1 < self.i3 && self.i2 && self.i4 );
    HZYhotelViewController *VC = [[HZYhotelViewController alloc] init];
    if (result1 && result2 && result3 && result4 && result5) {
        VC.str1 = self.i1;
        VC.str2 = self.i2;
        VC.str3 = self.i3;
        VC.str4 = self.i4;
        [self.navigationController pushViewController:VC animated:YES];
        
    }
    else{
        NSString *title = @"提示";
        NSString *message = @"请输入正确的!完整的!日期";
        NSString *cancelButtonTitle = @"确定";
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
        }];
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
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
