//
//  HZYgenduoViewController.m
//  世界辣么大
//
//  Created by dllo on 16/3/5.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYgenduoViewController.h"
#import "HZYgenduoCollectionViewCell.h"
#import "HZYNetWorkTool.h"
#import "HZYgenduoModel.h"
#import <UIImageView+WebCache.h>
#import "HZYWebController.h"
@interface HZYgenduoViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, retain) UICollectionView *collectionView;
@property (nonatomic ,retain) NSMutableArray *genduoArr;
@end

@implementation HZYgenduoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *itrm = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"fan4.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(GG)];
    self.navigationItem.leftBarButtonItem = itrm;
    [self ThreeData];
    [self creat];
}
- (void)GG{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)ThreeData{
    self.genduoArr = [NSMutableArray array];
    [HZYNetWorkTool getWithURL:@"http://open.qyer.com/lastminute/app_lastminute_list?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&continent_id=0&count=20&country_id=0&departure=&is_show_pay=1&is_show_supplier=1&lat=38.88252452160724&lon=121.5395722976516&max_id=0&oauth_token=7ed3ae5c6cd23159f4cee9adc1f5fe55&page=1&page_size=20&product_type=0&times=&track_app_version=6.8.4&track_deviceid=F1CC1DC7-CC07-473E-BE71-407A9CED5975&track_user_id=7562345&v=1" parameter:nil httpHeader:nil responseType:ResponseTypeJSON progress:^(NSProgress *progress) {
    } sucess:^(id result) {
        NSDictionary *dic = [result objectForKey:@"data"];
        NSMutableArray *array = [dic objectForKey:@"lastminutes"];
        for (NSDictionary *dict in array) {
            HZYgenduoModel *model = [[HZYgenduoModel alloc] initWithDic:dict];
            [self.genduoArr addObject:model];
        }
        [self.collectionView reloadData];
    } fail:^(NSError *error) {
        NSLog(@"404");
        
    }];
    
}
- (void)creat{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(15, 10, 15, 10);
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 10;
    layout.itemSize = CGSizeMake((self.view.frame.size.width - 34) / 2, 240);
    self.collectionView  = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64) collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[HZYgenduoCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:self.collectionView];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.genduoArr.count;

}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HZYgenduoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell.imageview sd_setImageWithURL:[NSURL URLWithString:[self.genduoArr[indexPath.item] pic]]];
    cell.titleLabel.text = [self.genduoArr[indexPath.item] title];
    cell.dateLabel.text = [NSString stringWithFormat:@"日期: %@",[self.genduoArr[indexPath.item] departureTime]];
    cell.lowLabel.text = [self.genduoArr[indexPath.item] lastminute_des];
    NSString *str = [self.genduoArr[indexPath.item] price];
    cell.priceLabel.textColor = [UIColor orangeColor];
    cell.priceLabel.text = [NSString stringWithFormat:@"%@元起", [str substringWithRange:NSMakeRange(4, str.length - 11)]];
    return cell;

}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;

}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    HZYWebController *VCX = [[HZYWebController alloc] init];
    VCX.genduoMod = self.genduoArr[indexPath.item];
    [self.navigationController pushViewController:VCX animated:YES];
    
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
