//
//  HZYsearchController.m
//  世界辣么大
//
//  Created by dllo on 16/3/5.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYsearchController.h"
#import "HZYNetWorkTool.h"
#import "HZYsearchModel.h"
#import <UIImageView+WebCache.h>
#import "HZYWebOne.h"
#import "HZYsearchTModel.h"

@interface HZYsearchController ()<UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate>
@property (nonatomic ,retain) UITableView *tabView;
@property (nonatomic ,retain) UISearchBar *sear;
@property (nonatomic, retain) NSMutableArray *arra;
@property (nonatomic, retain) NSString *ID;
@property (nonatomic, retain) HZYsearchTModel *modell;
@end

@implementation HZYsearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"fanfan.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(jump)];
    
    self.sear = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 50, 40)];
    [self.sear setBarStyle:UIBarStyleBlackOpaque];
    self.sear.placeholder = @"搜!~~~~~~~";
    self.sear.delegate = self;
    self.navigationItem.titleView =  self.sear;
 
   
    [self creat];
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    self.arra = [NSMutableArray array];
    NSString *str1 = self.sear.text;
    NSLog(@"%@",self.sear.text);
    NSString *sss =  [str1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *str = [NSString stringWithFormat:SOURCHHTTP, sss];
     [HZYNetWorkTool getWithURL:str parameter:nil httpHeader:nil responseType:ResponseTypeJSON progress:^(NSProgress *progress) {
     } sucess:^(id result) {
         NSLog(@"%@",result);
            NSDictionary *dic = [result objectForKey:@"data"];
            NSMutableArray *array = [dic objectForKey:@"entry"];
         for (NSDictionary *dict in array) {
             HZYsearchModel *model = [[HZYsearchModel alloc] initWithDic:dict];
             [self.arra addObject:model];
         }
         if (self.arra.count == 0) {
             UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
             }];
             UIAlertController *VC = [UIAlertController alertControllerWithTitle:@"提示" message:@"搜索的为空" preferredStyle:UIAlertControllerStyleAlert];
             [VC addAction:action];
             [self presentViewController:VC animated:YES completion:^{
            
             }];
         }
         
         
         [self.tabView reloadData];
     } fail:^(NSError *error) {
         NSLog(@"50");
     }];
}
- (void)jump{
    [self.navigationController popToRootViewControllerAnimated:YES];


}
- (void)creat{
    self.tabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 49) style:UITableViewStylePlain];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    [self.view addSubview:self.tabView];


}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arra.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
  
    
    cell.textLabel.text = [self.arra[indexPath.row] cnname];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[self.arra[indexPath.row] photo]]];
    cell.detailTextLabel.text = [self.arra[indexPath.row] enname];
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [HZYNetWorkTool getWithURL:[NSString stringWithFormat:SOURCHHTTP_TWO,[self.arra[indexPath.row] ID]] parameter:nil httpHeader:nil responseType:ResponseTypeJSON progress:^(NSProgress *progress) {
    } sucess:^(id result) {
        NSDictionary *dic = [result objectForKey:@"data"];
        self.modell = [[HZYsearchTModel alloc] initWithDic:dic];
        HZYWebOne *VCR = [[HZYWebOne alloc] init];
        VCR.mod = self.modell.qyerurl;
        [self.navigationController pushViewController:VCR animated:YES];
    } fail:^(NSError *error) {
    }];
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
