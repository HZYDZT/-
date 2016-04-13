//
//  RecommendVC.m
//  世界辣么大
//
//  Created by dllo on 16/2/25.
//  Copyright © 2016年 洪振宇. All rights reserved.
//
#import "AppDelegate.h"
#import "MJRefresh.h"
#import "RecommendVC.h"
#import "HZYWebController.h"
#import "HZYWebOne.h"
#import "HZYBtnVC.h"
#import "SlideModel.h"
#import "HZYpriceModel.h"
#import "HZYlastModel.h"
#import "HZYgenduoModel.h"
#import "HZYReusableView.h"
#import "HZYCReusableView.h"
#import "HZYHollectionReusableView.h" 
#import "HZYsearchController.h"
#import "UIImageView+WebCache.h"
#import "HZYCollectionViewCell.h"
#import "HZYTwoCell.h"
#import "HZYOnepageCell.h"
#import "HZYlastController.h"
#import "HZYNetWorkTool.h"
#import "FMDB.h"
#import "SqliteFmdbTool.h"
#import "HZYVmoreController.h"
#import "HZYgenduoViewController.h"
#import "HZYTravelViewController.h"
#import "HZYtextViewController.h"
#import "HZYDituViewController.h"
#define Width self.view.frame.size.width
#define Height self.view.frame.size.height
@interface RecommendVC ()<UIScrollViewDelegate, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UIScrollViewDelegate>
@property (nonatomic, retain) NSMutableArray *subjectArray;
@property (nonatomic, retain) NSMutableArray *slideArray;
@property (nonatomic, retain) NSMutableArray *discountArr;
@property (nonatomic, retain) UIScrollView *scrollerView;
@property (nonatomic, retain) UICollectionView *collectionView;
@property (nonatomic, retain) NSMutableArray *lastArray;
@property (nonatomic, retain) UISearchBar *searchBar;
@property (nonatomic ,retain) NSTimer *timer;
@end
@implementation RecommendVC
- (NSMutableArray *)lastArray{
    if (_lastArray == nil) {
        _lastArray = [NSMutableArray array];
    }return _lastArray;
}
- (NSMutableArray *)slideArray{
    if (_slideArray == nil) {
        _slideArray = [NSMutableArray array];
    }return _slideArray;
}
- (NSMutableArray *)subjectArray{
    if (_subjectArray == nil) {
        _subjectArray = [NSMutableArray array];
    }return _subjectArray;
}
- (NSMutableArray *)discountArr{
    if (_discountArr == nil) {
        _discountArr = [NSMutableArray array];
    }return _discountArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatSearch];
    [self Collection];
    [self anilysis];
    [self creatData];
}
- (void)creatSearch{
    //导航按钮
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"iconfont-chouti2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStylePlain target:self action:@selector(jump)];
     self.navigationItem.leftBarButtonItem = item;
}
//按钮的跳转方法
- (void)jump{
    AppDelegate *tempApp = (AppDelegate *) [[UIApplication sharedApplication]delegate];
    if (tempApp.leftSlideVC.closed) {
        [tempApp.leftSlideVC openLeftView];
    } else
    {
        [tempApp.leftSlideVC closeLeftView];
    }
}
//按钮的跳转方法
//解析数据 首页数据
- (void)creatData{
    static int i = 1;
    [HZYNetWorkTool getWithURL:[NSString stringWithFormat:ONEPAGEHTTP, i] parameter:nil httpHeader:nil responseType:ResponseTypeJSON progress:^(NSProgress *progress) {
    } sucess:^(id result) {
        NSMutableArray *arr = [result objectForKey:@"data"];
        for (NSDictionary *dic in arr) {
            HZYlastModel *model = [[HZYlastModel alloc] initWithDic:dic];
            [_lastArray addObject:model];
        }
        [self.collectionView.mj_footer endRefreshing];
        [self.collectionView reloadData];
    } fail:^(NSError *error) {
    }];
    i++;
}
//解析 轮播图数据
- (void)anilysis{
    //首页轮播图以及cell的网址
    NSString *path = ONEPAGEHTTP_LUNBO;
    [HZYNetWorkTool getWithURL:path parameter:nil httpHeader:nil responseType:ResponseTypeJSON progress:^(NSProgress *progress) {
    } sucess:^(id result) {
        NSDictionary *dic = [result objectForKey:@"data"];
        NSMutableArray *array = [dic objectForKey:@"slide"];
        for (NSDictionary *dict in array) {
            SlideModel *model = [SlideModel slideModelDic:dict];
            [self.slideArray addObject:model];
        }
        NSMutableArray *arr = [dic objectForKey:@"subject"];
        for (NSDictionary *dicT in arr) {
            SlideModel *mode = [SlideModel slideModelDic:dicT];
            [self.subjectArray addObject:mode];
        }
        NSMutableArray *arra = [dic objectForKey:@"discount"];
        for (NSDictionary *dic in arra) {
            HZYpriceModel *model = [[HZYpriceModel alloc] initWithDic:dic];
            [_discountArr addObject:model];
        }
        [self.collectionView reloadData];
    } fail:^(NSError *error) {

    }];
}
- (void)Collection{
    //初始化自定义布局 系统的流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 55, 5);
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 50;
    layout.itemSize = CGSizeMake((self.view.frame.size.width - 30) / 2, 130);
    //创建collectionview
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, Width, Height - 64 ) collectionViewLayout:layout];
    //注册cell 3种cell
    [self.collectionView registerClass:[HZYCollectionViewCell class] forCellWithReuseIdentifier:@"hzy"];
    [self.collectionView registerClass:[HZYTwoCell class] forCellWithReuseIdentifier:@"hzy2"];
    [self.collectionView registerClass:[HZYOnepageCell class] forCellWithReuseIdentifier:@"hzy3"];
    //注册3种头视图
    [self.collectionView registerClass:[HZYReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head"];
    [self.collectionView registerClass:[HZYCReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head2"];
    [self.collectionView registerClass:[HZYHollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head3"];
    
    //MJ刷新
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(creatData)];
    [footer setTitle:@"加载完成!" forState:MJRefreshStateIdle];
    [footer setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@"没有更多数据了" forState:MJRefreshStateNoMoreData];
    footer.stateLabel.font = [UIFont systemFontOfSize:17];
    footer.stateLabel.textColor = [UIColor blueColor];
    self.collectionView.mj_footer = footer;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
}

//头视图的协议方法
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        //自定义的colletion 头视图
        HZYReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head" forIndexPath:indexPath];
        
        self.scrollerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, Width, 200)];
        self.scrollerView.contentSize = CGSizeMake(Width * 4, 200);
        self.scrollerView.backgroundColor = [UIColor cyanColor];
        self.scrollerView.bounces = NO;
        self.scrollerView.pagingEnabled = YES;
    for (int i = 0; i < 4; i++) {
     UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(Width * i, 0, Width, 200)];
        if (self.slideArray.count != 0) {
         [imageView sd_setImageWithURL:[NSURL URLWithString:[self.slideArray[i] photo]]];
    }
             self.scrollerView.delegate = self;
            [self.scrollerView addSubview:imageView];
        }
        //属性传值
        [view.btn addTarget:self action:@selector(btnJumpOne) forControlEvents:UIControlEventTouchUpInside];
        [view.btn2 addTarget:self action:@selector(btnJumpTwo) forControlEvents:UIControlEventTouchUpInside];
        [view.btn3 addTarget:self action:@selector(btnJumpThree) forControlEvents:UIControlEventTouchUpInside];
        [view.btn4 addTarget:self action:@selector(btnjumpFour) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:self.scrollerView];
        view.backgroundColor = [UIColor cyanColor];
        return view;
        
    }else if(indexPath.section == 1){
        HZYCReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head2" forIndexPath:indexPath];
        [headView.moreTitle addTarget:self action:@selector(moretitle) forControlEvents:UIControlEventTouchUpInside];
        UIImageView *imaghViewForTwo = [[UIImageView alloc] initWithFrame:CGRectMake(5, 30, Width - 10, 170)];
        imaghViewForTwo.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [imaghViewForTwo addGestureRecognizer:tap];
        [imaghViewForTwo sd_setImageWithURL:[NSURL URLWithString:[[self.subjectArray firstObject] photo]]];
        [headView addSubview:imaghViewForTwo];
        return headView;
        
    }else if(indexPath.section == 2){
        HZYHollectionReusableView *Jview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head3" forIndexPath:indexPath];
        [Jview.genduo addTarget:self action:@selector(genduo) forControlEvents:UIControlEventTouchUpInside];
        [Jview addSubview:Jview.genduo];
        return Jview;
    }else{
        return nil;
    }
}
//跳转方法
- (void)genduo{
    HZYgenduoViewController *VC = [[HZYgenduoViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}
- (void)moretitle{
    HZYVmoreController *vcb = [[HZYVmoreController alloc] init];
    [self.navigationController pushViewController:vcb animated:YES];
}
- (void)tap{
    HZYWebOne *Vc1 = [[HZYWebOne alloc] init];
    Vc1.code = [self.subjectArray firstObject];
    [self.navigationController pushViewController:Vc1 animated:YES];
}
- (void)btnJumpOne{
    HZYBtnVC *vc = [[HZYBtnVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)btnJumpTwo{
    HZYTravelViewController *Vc = [[HZYTravelViewController alloc] init];
    [self.navigationController pushViewController:Vc animated:YES];
}
- (void)btnJumpThree{
    HZYtextViewController *VC = [[HZYtextViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}
- (void)btnjumpFour{
    HZYDituViewController *VC = [[HZYDituViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];

}
//布局的size
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        collectionViewLayout.headerReferenceSize = CGSizeMake(Width, 300);
        return collectionViewLayout.headerReferenceSize;
    }
    if (section == 1){
        collectionViewLayout.headerReferenceSize = CGSizeMake(Width, 200);
        return collectionViewLayout.headerReferenceSize;
    }
    if (section == 2){
        collectionViewLayout.headerReferenceSize = CGSizeMake(Width, 200);
        return collectionViewLayout.headerReferenceSize;
    }
    else {
        CGSize size = CGSizeMake(0, 0);
        return size;
    }
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 4;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else if (section == 1){
        return 2;
    }else if(section == 2){
        return self.discountArr.count;
    }else{
        return self.lastArray.count;
    }
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        HZYCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"hzy" forIndexPath:indexPath];
        if (self.subjectArray.count != 0) {
            [cell.picImageView sd_setImageWithURL:[NSURL URLWithString:[self.subjectArray[indexPath.item + 1] photo]]];
        }
        return cell;
    }else if(indexPath.section == 2){
        HZYTwoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"hzy2" forIndexPath:indexPath];
        if (self.discountArr.count != 0) {
            HZYpriceModel *model = self.discountArr[indexPath.item];
            [cell.imageView sd_setImageWithURL:model.photo];
            cell.titleLabel.text = [self.discountArr[indexPath.item] title];
            cell.titleLabel.numberOfLines = 0;
            cell.titleLabel.font = [UIFont systemFontOfSize:14];
            cell.priceOffLabel.text = [self.discountArr[indexPath.item] priceoff];
            cell.priceOffLabel.font = [UIFont systemFontOfSize:12];
            NSString *str = [self.discountArr[indexPath.item] price];
            cell.priceLabel.text =  [str substringWithRange:NSMakeRange(4, str.length - 11)];
            cell.priceLabel.textColor = [UIColor orangeColor];
            cell.priceLabel.font = [UIFont systemFontOfSize:18];
            cell.priceTlable.text = @"元起";
            cell.priceTlable.textColor = [UIColor purpleColor];
            cell.priceTlable.font = [UIFont systemFontOfSize:11];
        }return cell;
    }else if (indexPath.section == 3){
        HZYOnepageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"hzy3" forIndexPath:indexPath];
        [cell.imgbView sd_setImageWithURL:[NSURL URLWithString:[self.lastArray[indexPath.item] photo]]];
//        cell.label1.textColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
        cell.label1.text = [self.lastArray[indexPath.item] title];
        return cell;
    }else{
        return nil;
    }
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    HZYWebOne *VC = [[HZYWebOne alloc] init];
    HZYWebController *Vc2 = [[HZYWebController alloc] init];
    HZYlastController *VC3 = [[HZYlastController alloc] init];
    for (int i = 0; i < 2; i++) {
        if (indexPath.section == 1 && indexPath.item == i) {
            VC.code = self.subjectArray[indexPath.item + 1];
            [self.navigationController pushViewController:VC animated:YES];
        }
    }
    for (int i = 0; i < 4; i++) {
        if (indexPath.section == 2 && indexPath.item == i) {
            Vc2.model = self.discountArr[indexPath.item];
            [self.navigationController pushViewController:Vc2 animated:YES];
        }
    }
    if (indexPath.section == 3 ) {
        VC3.sr = [self.lastArray[indexPath.item] view_url];
        [self.navigationController pushViewController:VC3 animated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
