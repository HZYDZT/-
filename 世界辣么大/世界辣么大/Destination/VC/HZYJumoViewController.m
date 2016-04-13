//
//  HZYJumoViewController.m
//  世界辣么大
//
//  Created by dllo on 16/3/12.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYJumoViewController.h"
#import "HZYNetWorkTool.h"
#import <UIImageView+WebCache.h>
#import "HZYcity.h"
#import "HZYmguide.h"
@interface HZYJumoViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) UITableView *tabView;
@property (nonatomic, retain) UIView *backView;
@property (nonatomic, retain) UIScrollView *scrollerView;
@property (nonatomic, retain) UIImageView *scor;
@property (nonatomic, retain) UIImageView *imag0;
@property (nonatomic, retain) UIImageView *imag1;
@property (nonatomic, retain) UIImageView *imag2;
@property (nonatomic, retain) UIImageView *imag3;
@property (nonatomic, retain) UILabel *labe1;
@property (nonatomic, retain) UILabel *labe2;
@property (nonatomic, retain) UILabel *labe3;
@property (nonatomic, retain) UILabel *labe4;
@property (nonatomic, retain) NSMutableArray *photoArr;
@property (nonatomic, retain) NSMutableArray *hot_cityArr;
@property (nonatomic, retain) NSMutableArray *hot_mguides;
@end

@implementation HZYJumoViewController
- (NSMutableArray *)photoArr{
    if (_photoArr == nil) {
        _photoArr = [NSMutableArray array];
    }return _photoArr;

}
- (NSMutableArray *)hot_cityArr{
    if (_hot_cityArr == nil) {
        _hot_cityArr = [NSMutableArray array];
    }return _hot_cityArr;
}
-  (NSMutableArray *)hot_mguides{
    if (_hot_mguides == nil) {
        _hot_mguides = [NSMutableArray array];
    }return _hot_mguides;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creat];
    [self creatScor];
    [self creatData];
}
- (void)creatData{
    [HZYNetWorkTool getWithURL:[NSString stringWithFormat:@"http://open.qyer.com/qyer/footprint/country_detail?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&country_id=%@&lat=38.88246107713998&lon=121.5396232255516&oauth_token=7ed3ae5c6cd23159f4cee9adc1f5fe55&page=1&track_app_version=6.8.4&track_deviceid=F1CC1DC7-CC07-473E-BE71-407A9CED5975&track_user_id=7562345&v=1", self.ID] parameter:nil httpHeader:nil responseType:ResponseTypeJSON progress:^(NSProgress *progress) {
    } sucess:^(id result) {
        NSDictionary *dic  = [result objectForKey:@"data"];
        self.photoArr = [dic objectForKey:@"photos"];
        for (int i = 0; i < self.photoArr.count; i++) {
            UIImageView *imagViewP = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width* i, 0, self.view.frame.size.width, 240)];
            if (self.photoArr.count == 1) {
                self.scrollerView.scrollEnabled = NO;
            }
        [imagViewP sd_setImageWithURL:[NSURL URLWithString:self.photoArr[i]]];
            [self.scrollerView addSubview:imagViewP];
        }
        NSMutableArray *array = [dic objectForKey:@"hot_city"];
        for (NSDictionary *dict in array) {
            HZYcity *model = [[HZYcity alloc] initWithDic:dict];
            [self.hot_cityArr addObject:model];
        }
        if (self.hot_cityArr.count >= 1) {
        [self.imag0 sd_setImageWithURL:[NSURL URLWithString:[self.hot_cityArr[0] photo]]];
        self.labe1.text = [self.hot_cityArr[0] cnname];
//            self.scrollerView.scrollEnabled = NO;
        }
        if (self.hot_cityArr.count > 2) {
        [self.imag1 sd_setImageWithURL:[NSURL URLWithString:[self.hot_cityArr[1] photo]]];
        self.labe2.text = [self.hot_cityArr[1] cnname];
        }
        if (self.hot_cityArr.count > 3){
        [self.imag2 sd_setImageWithURL:[NSURL URLWithString:[self.hot_cityArr[2] photo]]];
        self.labe3.text = [self.hot_cityArr[2] cnname];
        }
        if (self.hot_cityArr.count > 3){
        [self.imag3 sd_setImageWithURL:[NSURL URLWithString:[self.hot_cityArr[3] photo]]];
         self.labe4.text = [self.hot_cityArr[3] cnname];
        }
        
        NSMutableArray *arr = [dic objectForKey:@"hot_mguide"];
        for (NSDictionary *dic in arr) {
            HZYmguide *mod = [[HZYmguide alloc] initWithDic:dic];
            [self.hot_mguides addObject:mod];
        }
        [self.tabView reloadData];
    } fail:^(NSError *error) {
        NSLog(@"解析错误");
    }];
}
- (void)creatScor{
    self.scrollerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 240)];
    self.scrollerView.contentSize = CGSizeMake(self.view.frame.size.width * 5, 240);
    self.scrollerView.pagingEnabled = YES;
   [self.backView addSubview:self.scrollerView];

}
- (void)creat{
    self.tabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 49) style:UITableViewStylePlain];
    self.backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 560)];
    self.imag0 = [[UIImageView alloc] initWithFrame:CGRectMake(15, 300, ([UIScreen mainScreen].bounds.size.width - 40) / 2, 110)];
    self.imag1 = [[UIImageView alloc] initWithFrame:CGRectMake(15 +([UIScreen mainScreen].bounds.size.width - 40) / 2  + 10 , 300, ([UIScreen mainScreen].bounds.size.width - 40) / 2, 110)];
    self.imag2 = [[UIImageView alloc] initWithFrame:CGRectMake(15, 420, ([UIScreen mainScreen].bounds.size.width - 40) / 2, 110)];
    self.imag3 = [[UIImageView alloc] initWithFrame:CGRectMake(15 + ([UIScreen mainScreen].bounds.size.width - 40) / 2  + 10, 420, ([UIScreen mainScreen].bounds.size.width - 40) / 2, 110)];
    
    
    UILabel *labelt = [[UILabel alloc] initWithFrame:CGRectMake(15, 250, 100, 40)];
    self.labe1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    self.labe1.textAlignment = NSTextAlignmentCenter;
    self.labe1.textColor = [UIColor whiteColor];
    [self.imag0 addSubview:self.labe1];
    
    self.labe2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    self.labe2.textAlignment = NSTextAlignmentCenter;
    self.labe2.textColor = [UIColor whiteColor];
    [self.imag1 addSubview:self.labe2];
    self.labe3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    self.labe3.textAlignment = NSTextAlignmentCenter;
    self.labe3.textColor = [UIColor whiteColor];
    [self.imag2 addSubview:self.labe3];
    self.labe4 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    self.labe4.textAlignment = NSTextAlignmentCenter;
    self.labe4.textColor = [UIColor whiteColor];
    [self.imag3 addSubview:self.labe4];
    labelt.text = @"主要热门~";
    labelt.textColor = [UIColor grayColor];
    [self.backView addSubview:labelt];
    [self.backView addSubview:self.imag0];
    [self.backView addSubview:self.imag1];
    [self.backView addSubview:self.imag2];
    [self.backView addSubview:self.imag3];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    self.tabView.tableHeaderView = self.backView;
    [self.view addSubview:self.tabView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.hot_mguides.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    HZYTableCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HZYTableCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    if (self.hot_mguides.count != 0) {
    [cell.img sd_setImageWithURL:[NSURL URLWithString:[self.hot_mguides[indexPath.row] photo]]];
    }
    cell.lab.text = [self.hot_mguides[indexPath.row] title];
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
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
