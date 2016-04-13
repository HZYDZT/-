//
//  DestinationVC.m
//  世界辣么大
//
//  Created by dllo on 16/2/25.
//  Copyright © 2016年 洪振宇. All rights reserved.
//
#import "HZYCollectionCell.h"
#import "HZYSecReusableView.h"
#import "DestinationVC.h"
#import "HZYSecCollectionViewCell.h"
#import "HZYThreeReusableView.h"
//加载图片的框架
#import "UIImageView+WebCache.h"
//解析
#import "HZYNetWorkTool.h"
//模型
#import "HZYdestModel.h"
#import "HZYJumoViewController.h"
//宏定义 颜色随机数  尺寸
#import "HZYdestChildModel.h"
#define Width  self.view.frame.size.width
#define Color arc4random() % 256 / 255.0
//协议
@interface DestinationVC ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, retain) UICollectionView *collectionView;
@property (nonatomic, retain) HZYdestModel *model;
@property (nonatomic ,retain) NSMutableArray *arrHotC;
@property (nonatomic ,retain) NSMutableArray *arrHotCountry;
@property (nonatomic, retain) NSMutableArray *arrC;
@property (nonatomic, retain) NSMutableArray *arrCountry;

@property (nonatomic ,retain) NSMutableArray *dataArr;

@property (nonatomic ,assign) NSInteger  dataID;
@end
@implementation DestinationVC

- (NSMutableArray *)arrC{
    if (_arrC == nil) {
        _arrC = [NSMutableArray array];
    }return _arrC;
}
- (NSMutableArray *)arrHotC{
    if (_arrHotC == nil) {
        _arrHotC = [NSMutableArray array];
    }return _arrHotC;
}
- (NSMutableArray *)arrCountry{
    if (_arrCountry == nil) {
        _arrCountry = [NSMutableArray array];
    }return _arrCountry;
}
- (NSMutableArray *)arrHotCountry{
    if (_arrHotCountry == nil) {
        _arrHotCountry = [NSMutableArray array];
    }return _arrHotCountry;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataID = 0 ;
    [self creatData];
    [self creatCollectionView];
}

- (void)creatData{
    //第二页网址  解析
    self.dataArr = [NSMutableArray new];
    NSString *str = THREEPAGEONE;
    [HZYNetWorkTool getWithURL:str parameter:nil httpHeader:nil responseType:ResponseTypeJSON progress:^(NSProgress *progress) {
    } sucess:^(id result) {
        NSMutableArray *data = [result objectForKey:@"data"];
        for (NSDictionary *temp in data) {
            HZYdestModel *model = [HZYdestModel destModelWithDic:temp];
            [self.dataArr addObject:model];
        }
        NSLog(@"%@",self.dataArr);
        [self.collectionView reloadData];
    } fail:^(NSError *error) {
        NSLog(@"!!!");
    }];
}
- (void)creatCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(20, 10, 20, 10);
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 20;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, Width, self.view.frame.size.height - 49) collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[HZYCollectionCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[HZYSecCollectionViewCell class] forCellWithReuseIdentifier:@"cell1"];
    [self.collectionView registerClass:[HZYSecReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head"];
    [self.collectionView registerClass:[HZYThreeReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head1"];
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        HZYSecReusableView *sec = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head" forIndexPath:indexPath];
        [sec.northAmerica addTarget:self action:@selector(jump:) forControlEvents:UIControlEventTouchUpInside];
        [sec.southAmerica addTarget:self action:@selector(jump:) forControlEvents:UIControlEventTouchUpInside];
        [sec.europe addTarget:self action:@selector(jump:) forControlEvents:UIControlEventTouchUpInside];
        [sec.africa addTarget:self action:@selector(jump:) forControlEvents:UIControlEventTouchUpInside];
        [sec.asia addTarget:self action:@selector(jump:) forControlEvents:UIControlEventTouchUpInside];
        [sec.oceania addTarget:self action:@selector(jump:) forControlEvents:UIControlEventTouchUpInside];
        [sec.antarctica addTarget:self action:@selector(jump:) forControlEvents:UIControlEventTouchUpInside];
        return sec;
    }else if(indexPath.section == 1){
        HZYThreeReusableView *three = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head1" forIndexPath:indexPath];
        three.backLabel.text = @"其他热门目的地";
        return three;
    }else{
        return nil;
    }
}
- (void)jump:(UIButton *)btn{
    self.dataID =  (int)btn.tag  - 1001 ;
    [self.collectionView reloadData];
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        CGSize item = CGSizeMake(([UIScreen mainScreen].bounds.size.width - 30) / 2, 240);
        return item;
    }else{
        return CGSizeMake(([UIScreen mainScreen].bounds.size.width - 30) / 2, 80);
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        CGSize size = CGSizeMake(self.view.frame.size.width, 240);
        return size;
    }else{
        return CGSizeMake(self.view.frame.size.width, 90);
    }
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.dataArr.count) {
        
        HZYdestModel *model = self.dataArr[self.dataID];
        if (section == 0) {
            return model.hotArr.count;
        }
        else {
            return model.country.count;
        }

    }
    else{
        return 0;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HZYdestModel *model = self.dataArr[self.dataID];
    if (indexPath.section == 0) {
        HZYdestChildModel *childModel = model.hotArr[indexPath.item];
        HZYCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        [cell.imag sd_setImageWithURL:[NSURL URLWithString:childModel.photo]];
        cell.label1.text = childModel.cnname;
        return cell;
    }else{
        HZYdestChildModel *childModel = model.country[indexPath.item];
        HZYSecCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
        cell.label.text = childModel.cnname;
        cell.label2.text = childModel.enname;
        return cell;
    }
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;{
    HZYJumoViewController *Vc  = [[HZYJumoViewController alloc] init];
    HZYdestModel *model = self.dataArr[self.dataID];
    if (indexPath.section == 0) {
        HZYdestChildModel *childModel = model.hotArr[indexPath.item];
        if ([childModel.cnname isEqualToString:@"新加坡"]){
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            }];
            UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"警告" message:@"此页没有数据" preferredStyle:UIAlertControllerStyleAlert];
            [vc addAction:action];
            [self presentViewController:vc animated:YES completion:^{
            }];
        }
        else{
        Vc.ID = childModel.ID.stringValue;
        [self.navigationController pushViewController:Vc animated:YES];
        }
    }
    else{
        HZYdestChildModel *childModel = model.country[indexPath.item];
        if ([childModel.cnname isEqualToString:@"马尔代夫"]){
           UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
           }];
            UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"警告" message:@"此页没有数据" preferredStyle:UIAlertControllerStyleAlert];
            [vc addAction:action];
            [self presentViewController:vc animated:YES completion:^{
                
                
            }];
        }
        else{
        Vc.ID = childModel.ID.stringValue;
        [self.navigationController pushViewController:Vc animated:YES];
    }
    
    }
}
- (void)viewDidDisappear:(BOOL)animated{
    
//    self.collectionView.contentOffset = CGPointMake(0, 0);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
