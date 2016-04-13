//
//  HZYBtnVC.m
//  世界辣么大
//
//  Created by dllo on 16/2/27.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYBtnVC.h"
#import "HZYNetWorkTool.h"
#import "HZYBtnModel.h"
#import "HZYBtnCell.h"
#import <UIImageView+WebCache.h>
#import "HZYtitleRView.h"
@interface HZYBtnVC ()<UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, retain) UITableView *tabView;
@property (nonatomic ,retain) UICollectionView *cellectionView;
@property (nonatomic ,retain) NSMutableArray *dataArray;
@property (nonatomic ,retain) NSMutableArray *arr;
@property (nonatomic ,retain) NSMutableArray *modelArr;
@property (nonatomic ,assign) NSInteger i ;
@end
@implementation HZYBtnVC
- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"dd.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStylePlain target:self action:@selector(GG)];
    self.navigationItem.leftBarButtonItem = item;
    self.i = 657;
    [self creatData];
    [self rightData];
    [self creat];
    [self creatCollection];
}
- (void)GG{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)creatCollection{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    layout.itemSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width / 4 * 3 - 30) / 2, 200);
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 5;
    self.cellectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 4 + 1, 0, self.view.frame.size.width / 4 * 3, self.view.frame.size.height - 64) collectionViewLayout:layout];
    self.cellectionView.delegate = self;
    self.cellectionView.dataSource = self;
    self.cellectionView.backgroundColor = [UIColor whiteColor];
    [self.cellectionView registerClass:[HZYtitleRView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [self.cellectionView registerClass:[HZYBtnCell class] forCellWithReuseIdentifier:@"hzy"];
    [self.view addSubview:self.cellectionView];
}
- (void)creatData{
    NSString *str = @"http://open.qyer.com/qyer/guide/category_list?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&lat=38.88244043317796&lon=121.5394999091066&page=1&track_app_channel=App%2520Store&track_app_version=6.8.4&track_device_info=iPhone7%2C2&track_deviceid=F1CC1DC7-CC07-473E-BE71-407A9CED5975&track_os=ios%25209.2.1&v=1";
   [HZYNetWorkTool getWithURL:str parameter:nil httpHeader:nil responseType:ResponseTypeJSON progress:^(NSProgress *progress) {
   } sucess:^(id result) {
       NSMutableArray *array = [result objectForKey:@"data"];
       for (NSDictionary *dic in array) {
           HZYBtnModel *model = [[HZYBtnModel alloc] initWithDic:dic];
           [_dataArray addObject:model];
           NSLog(@"%@",self.dataArray);
       }
       [self.tabView reloadData];
       [self.cellectionView reloadData];
   } fail:^(NSError *error) {
       NSLog(@"~~~");
   }];
}
- (void)rightData{
    NSString *str = [NSString stringWithFormat:@"http://open.qyer.com/qyer/guide/channel_list?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&id=%ld&lat=38.88245155149916&lon=121.5396043241702&oauth_token=7ed3ae5c6cd23159f4cee9adc1f5fe55&page=1&track_app_version=6.8.4&track_deviceid=F1CC1DC7-CC07-473E-BE71-407A9CED5975&track_user_id=7562345&v=1",self.i];
  [HZYNetWorkTool getWithURL:str parameter:nil httpHeader:nil responseType:ResponseTypeJSON progress:^(NSProgress *progress) {
} sucess:^(id result) {
    
       self.modelArr = [NSMutableArray array];
    NSMutableArray *array = [result objectForKey:@"data"];
    self.arr = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        
        [self.arr addObject:[dic objectForKey:@"name"]];
        NSMutableArray *array1 = [NSMutableArray array];
        NSMutableArray *arra = [dic objectForKey:@"guides"];
        for (NSDictionary *dict in arra) {
            
            HZYguides *model = [HZYguides guidesWithDic:dict];
            [array1 addObject:model];
        }
        [self.modelArr addObject:array1];
    }
    [self.cellectionView reloadData];
    [self.tabView reloadData];
    self.cellectionView.contentOffset = CGPointMake(0, 0);
} fail:^(NSError *error) {
    NSLog(@"~~~");
}];
}
- (void)creat{
   self.tabView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width / 4, self.view.frame.size.height - 64) style:UITableViewStylePlain];
    self.tabView.rowHeight = 100;
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    [self.view addSubview:self.tabView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = [self.dataArray[indexPath.row] cnname];
    
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        self.i = 657;
        [self rightData];
    }else if (indexPath.row == 1){
        NSLog(@"!!!!");
        self.i = 658;
        [self rightData];
    }else if (indexPath.row == 2){
        NSLog(@"!!!!");
        self.i = 659;
        [self rightData];
    }else if (indexPath.row == 3){
        NSLog(@"!!!!");
        self.i = 660;
        [self rightData];
    }else if (indexPath.row == 4){
        NSLog(@"!!!!");
        self.i = 667;
        [self rightData];
    }else if (indexPath.row == 5){
        NSLog(@"!!!!");
        self.i = 668;
        [self rightData];
    }else if (indexPath.row == 6){
        NSLog(@"!!!!");
        self.i = 2759;
        [self rightData];
    }else if (indexPath.row == 7){
        NSLog(@"!!!!");
        self.i = 669;
        [self rightData];
    }else if (indexPath.row == 8){
        NSLog(@"!!!!");
        self.i = 2534;
        [self rightData];
    }
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    HZYtitleRView *resble = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        resble.labela.text = self.arr[indexPath.section];
        return resble;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return self.modelArr.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
        CGSize size = CGSizeMake(90, 30);
        return size;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"-----%ld", [self.modelArr[section] count]);
    return [self.modelArr[section] count];
 
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HZYBtnCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"hzy" forIndexPath:indexPath];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/140_210.jpg?cover_updatetime=%@",[self.modelArr[indexPath.section][indexPath.item] cover], [self.modelArr[indexPath.section][indexPath.item] update_time] ]]];
    return cell;
}













- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
