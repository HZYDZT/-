//
//  HZYhotelViewController.m
//  世界辣么大
//
//  Created by dllo on 16/3/9.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYhotelViewController.h"
#import "HZYHotelCollectionViewCell.h"
#import "HZYNetWorkTool.h"
#import "HZYHotelModel.h"
#import <UIImageView+WebCache.h>
#import "MJRefresh.h"
#import "HZYHotelPriceViewController.h"
#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height
@interface HZYhotelViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, retain) UICollectionView *collectionView;
@property (nonatomic, retain) NSMutableArray *modelArray;
@end

@implementation HZYhotelViewController
- (NSMutableArray *)modelArray{
    if (_modelArray == nil) {
        _modelArray = [NSMutableArray array];
    }return _modelArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"fan2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStylePlain target:self action:@selector(GG)];
    self.navigationItem.leftBarButtonItem = item;
    [self creat];
    [self creatData];
}
- (void)GG{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)creatData{
    static int i = 1;
     [HZYNetWorkTool getWithURL:[NSString stringWithFormat:@"http://open.qyer.com/qyer/hotel/hot_city_list?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=199&lat=38.88272168267709&lon=121.5397126317744&oauth_token=7ed3ae5c6cd23159f4cee9adc1f5fe55&page=%d&track_app_version=6.8.4&track_deviceid=F1CC1DC7-CC07-473E-BE71-407A9CED5975&track_user_id=7562345&v=1",i] parameter:nil httpHeader:nil responseType:ResponseTypeJSON progress:^(NSProgress *progress) {
     } sucess:^(id result) {
         NSMutableArray *array = [result objectForKey:@"data"];
         for (NSDictionary *dic in array) {
             HZYHotelModel *model = [[HZYHotelModel alloc] initWithDic:dic];
             [_modelArray addObject:model];
         }
         [self.collectionView.mj_footer endRefreshing];
         [self.collectionView reloadData];
     } fail:^(NSError *error) {
         NSLog(@"404");
         
     }];
    i++;
    
}
- (void)creat{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    layout.minimumInteritemSpacing = 3;
    layout.minimumLineSpacing = 3;
    layout.itemSize = CGSizeMake((WIDTH - 20) /3,  (HEIGHT - 49 - 26 - 64)/3);
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, HEIGHT - 49 ) collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[HZYHotelCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(creatData)];
    [footer setTitle:@"加载完成!" forState:MJRefreshStateIdle];
    [footer setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@"没有更多数据了" forState:MJRefreshStateNoMoreData];
    footer.stateLabel.textColor = [UIColor blueColor];
    self.collectionView.mj_footer = footer;
    [self.view addSubview:self.collectionView];

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.modelArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HZYHotelCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell.imagv sd_setImageWithURL:[NSURL URLWithString:[self.modelArray[indexPath.item] photo]]];
    cell.label.text = [self.modelArray[indexPath.item] cnname];
    cell.label.textColor = [UIColor whiteColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    HZYHotelPriceViewController *VC = [[HZYHotelPriceViewController alloc] init];
    VC.model = self.modelArray[indexPath.item];
    VC.s1 = self.str1;
    VC.s2 = self.str2;
    VC.s3 = self.str3;
    VC.s4 = self.str4;
    [self.navigationController pushViewController:VC animated:YES];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
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
