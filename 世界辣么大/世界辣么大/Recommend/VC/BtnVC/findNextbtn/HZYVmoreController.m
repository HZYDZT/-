//
//  HZYVmoreController.m
//  世界辣么大
//
//  Created by dllo on 16/3/4.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYVmoreController.h"
#import "HZYNetWorkTool.h"
#import "HZYmoreModel.h"
#import "HZYTableViewCell.h"
#import <UIImageView+WebCache.h>
#import "MJRefresh.h"
#import "HZYWebOne.h"
@interface HZYVmoreController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic ,retain) UITableView *tabView;
@property (nonatomic ,retain) NSMutableArray *array;
@end

@implementation HZYVmoreController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *itrm = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"fan1.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(GG)];
    self.navigationItem.leftBarButtonItem = itrm;
    [self creat];
    [self creatData];
    
}
- (void)GG{
    [self.navigationController popToRootViewControllerAnimated:YES];

}
- (void)creatData{
    self.array = [NSMutableArray array];
     [HZYNetWorkTool getWithURL:@"http://open.qyer.com/qyer/special/topic/special_list?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&lat=38.88251707832219&lon=121.5395430380455&page=1&track_app_channel=App%2520Store&track_app_version=6.8.4&track_device_info=iPhone7%2C2&track_deviceid=0F19D8B3-FAE4-4BDE-8144-43274E54C3CB&track_os=ios%25208.1&v=1" parameter:nil httpHeader:nil responseType:ResponseTypeJSON progress:^(NSProgress *progress) {
    } sucess:^(id result) {
//        NSLog(@"%@", result);
        NSMutableArray *arr =   [result objectForKey:@"data"];
        for (NSDictionary *dic in arr) {
            HZYmoreModel *model = [[HZYmoreModel alloc] initWithDic:dic];
            [self.array addObject:model];
        }
        [self.tabView reloadData];

    } fail:^(NSError *error) {
        NSLog(@"404");
    }];

 
}
- (void)creat{
    self.tabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
   
    [self.view addSubview:self.tabView];

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"hzy";
    HZYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HZYTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    [cell.imageViewa sd_setImageWithURL:[NSURL URLWithString:[self.array[indexPath.row] photo]]];
    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HZYWebOne *web  =[[HZYWebOne alloc] init];
    web.url = [self.array[indexPath.row] url];
    [self.navigationController pushViewController:web animated:YES];
    

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
