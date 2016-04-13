//
//  CommunityVC.m
//  世界辣么大
//
//  Created by dllo on 16/2/25.
//  Copyright © 2016年 洪振宇. All rights reserved.
//
#import "CommunityVC.h"
//自定义cell
#import "HZYtravelCell.h"
//解析工具
#import "HZYNetWorkTool.h"
#import "HZYtravelModel.h"
#import <UIImageView+WebCache.h>
#import "MJRefresh.h"
#import "HZYLunbo.h"
#import "HZYCellVc.h"
#define width    self.view.frame.size.width
#define height  self.view.frame.size.height
@interface CommunityVC ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
@property (nonatomic, retain) UITableView *tabView;
//模型数组
@property (nonatomic, retain) NSMutableArray *modelArray;
//轮播图属性 三发轮播图
@property (nonatomic, assign) int before;
@property (nonatomic, assign) int next;
@property (nonatomic, assign) int current;
@property (nonatomic ,retain) UIImageView *imageView1;
@property (nonatomic ,retain) UIImageView *imageView2;
@property (nonatomic ,retain) UIImageView *imageView3;
//轮播图
@property (nonatomic ,retain) UIScrollView *scrollView;
//轮播图数组属性
@property (nonatomic ,retain) NSMutableArray *CarouselArray;
//轮播图取前几个数据
@property (nonatomic ,retain) NSMutableArray *carouselSubArr;
@end

@implementation CommunityVC
- (NSMutableArray *)carouselSubArr{
    if (_carouselSubArr == nil) {
        _carouselSubArr = [NSMutableArray array];
    }return _carouselSubArr;
}
//轮播图数组
- (NSMutableArray *)CarouselArray{
    if (_CarouselArray == nil) {
        _CarouselArray = [NSMutableArray array];
    }return _CarouselArray;
}
- (NSMutableArray *)modelArray{
    if (_modelArray == nil) {
        _modelArray = [NSMutableArray array];
    }return _modelArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"旅游也需要轻松一刻±±";
    //动态轮播图
    [self creatCarouse];
    //解析旅游新闻数据
    [self creatNewsData];
    [self creatTabView];
}
- (void)creatCarouse{
    //轮播图网址
    NSString *string = @"http://api.app.happyjuzi.com/v2.9/article/list/gif?net=wifi&page=1&pf=ios&res=375x667&size=20&uid=3932585914797977&ver=2.9.1";
    //解析
    [HZYNetWorkTool getWithURL:string parameter:nil httpHeader:nil responseType:ResponseTypeJSON progress:^(NSProgress *progress) {
    } sucess:^(id result) {
        //jason字典 -> data字典 -> list数组 -> 0-20个字典 -> gif数组 -> 最里层字典 -> URL属性
       NSDictionary *dataDic = [result objectForKey:@"data"];
       NSMutableArray *listArray = [dataDic objectForKey:@"list"];
        //0 - 20个字典
        for (NSDictionary *temp in listArray) {
            //每次遍历都创建一个数组总共20个数组
            NSMutableArray *arr = [temp objectForKey:@"gif"];
            //数组中的第一个元素是字典 最里层字典转模型
            HZYLunbo *mod = [[HZYLunbo alloc] initWithUrl:[[arr firstObject] objectForKey:@"url"] ];
            [self.CarouselArray addObject:mod];
    }
        self.current =  0;
        self.next = 1;
        self.before = 7;
       [self.tabView reloadData];
    } fail:^(NSError *error) {
        NSLog(@"解析失败!!");
    }];
}
- (void)creatNewsData{
    //旅游新闻网址 最新的20条
    NSString *path = @"http://c.3g.163.com/nc/article/list/T1348654204705/0-20.html";
    [HZYNetWorkTool getWithURL:path parameter:nil httpHeader:nil responseType:ResponseTypeJSON progress:^(NSProgress *progress) {
    } sucess:^(id result) {
        //json 字典 -> T1348654204705大数组 -> 20个字典 -> 字典转模型
     NSMutableArray *Tarray = [result objectForKey:@"T1348654204705"];
      for (NSDictionary *dic in Tarray) {
        HZYtravelModel *model = [[HZYtravelModel alloc] initWithDic:dic];
         [self.modelArray addObject:model];
        }
        [self.tabView.mj_header endRefreshing];
        [self.tabView reloadData];
    } fail:^(NSError *error) {
        NSLog(@"解析失败!!!");
    }];
}
- (UIView *)scroller{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, 200)];
        self.scrollView.delegate = self;
        self.scrollView.contentSize = CGSizeMake(width * 3, 200);
        self.scrollView.pagingEnabled = YES;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.contentOffset = CGPointMake(width, 0);
        if (self.CarouselArray.count != 0) {
            self.imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, 200)];
            self.imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(width, 0, width, 200)];
            self.imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(width * 2, 0, width, 200)];
            [self.imageView1 sd_setImageWithURL:[self.CarouselArray[0] url]];
            [self.imageView2 sd_setImageWithURL:[self.CarouselArray[1] url]];
            [self.imageView3 sd_setImageWithURL:[self.CarouselArray[2] url]];
            [self.scrollView addSubview:self.imageView1];
            [self.scrollView addSubview:self.imageView2];
            [self.scrollView addSubview:self.imageView3];
        }
        return self.scrollView;
}
- (void)creatTabView{
    self.tabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, height - 64) style:UITableViewStylePlain];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    //创建tabView里面写MJ刷新方法
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.tabView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self creatNewsData];
    }];
    // 马上进入刷新状态
    [self.tabView.mj_header beginRefreshing];
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(addData)];
    // 设置文字
    [footer setTitle:@"Click or drag up to refresh" forState:MJRefreshStateIdle];
    [footer setTitle:@"加载更多数据~~~" forState:MJRefreshStateRefreshing];
    [footer setTitle:@"没有更多的数据~~~" forState:MJRefreshStateNoMoreData];
    // 设置字体
    footer.stateLabel.font = [UIFont systemFontOfSize:17];
    // 设置颜色
    footer.stateLabel.textColor = [UIColor blueColor];
    // 设置footer
    self.tabView.mj_footer = footer;
    [self.view addSubview:self.tabView];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
   
    if (self.CarouselArray.count != 0) {
        for (int i = 0; i < 8; i++) {
            [self.carouselSubArr addObject:self.CarouselArray[i]];
        }
    if (self.scrollView.contentOffset.x == width * 2) {
        self.scrollView.contentOffset = CGPointMake(width, 0);
        self.before++;
        if (self.before > self.carouselSubArr.count - 1) {
            self.before = 0;
        }
        self.current++;
        if (self.current > self.carouselSubArr.count - 1){
            self.current =  0;
        }
        self.next++;
        if (self.next > self.carouselSubArr.count - 1) {
            self.next = 0;
        }
    }else if (self.scrollView.contentOffset.x == 0){
        self.scrollView.contentOffset = CGPointMake(width, 0);
        self.before--;
        if (self.before < 0) {
            self.before = (int)self.carouselSubArr.count - 1;
        }
        self.current--;
        if (self.current < 0) {
            self.current = (int)self.carouselSubArr.count - 1;
        }
        self.next--;
        if (self.next < 0) {
            self.next = (int)self.carouselSubArr.count - 1;
        }
    }
       [self.imageView1 sd_setImageWithURL:[self.carouselSubArr[self.before] url]];
       [self.imageView2 sd_setImageWithURL:[self.carouselSubArr[self.current] url]];
       [self.imageView3 sd_setImageWithURL:[self.carouselSubArr[self.next] url]];
    }
}

- (void)addData{
    //上拉加载
    static int i = 0;
    NSString *str = [NSString stringWithFormat:@"http://c.3g.163.com/nc/article/list/T1348654204705/%d-20.html", i];
    [HZYNetWorkTool getWithURL:str parameter:nil httpHeader:nil responseType:ResponseTypeJSON progress:^(NSProgress *progress) {
    } sucess:^(id result) {
        NSMutableArray *array = [result objectForKey:@"T1348654204705"];
        for (NSDictionary *dic in array) {
            HZYtravelModel *model = [[HZYtravelModel alloc] initWithDic:dic];
            [self.modelArray addObject:model];
        }
        NSLog(@"%@", self.modelArray);
        [self.tabView reloadData];
        [self.tabView.mj_footer endRefreshing];
    } fail:^(NSError *error) {
        NSLog(@"aa");
    }];
    i += 20;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    self.tabView.tableHeaderView = [self scroller];
    static NSString *ID = @"cell";
    HZYtravelCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HZYtravelCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    [cell.img sd_setImageWithURL:[NSURL URLWithString:[self.modelArray[indexPath.row] imgsrc]]];
    cell.title.text = [self.modelArray[indexPath.row] title];
    cell.digest.text = [self.modelArray[indexPath.row] digest];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation( (90.0 * M_PI) / 180, 0.0, 0.7, 0.4);
    rotation.m34 = 1.0 / -600;
    
    cell.layer.shadowColor = [[UIColor blackColor] CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    cell.layer.transform = rotation;
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.8];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HZYCellVc *VC = [[HZYCellVc alloc] init];
    VC.str = [self.modelArray[indexPath.row] url_3w];
    VC.imgscr = [self.modelArray[indexPath.row] imgsrc];
    VC.title = [self.modelArray[indexPath.row] title];
    [self.navigationController pushViewController:VC animated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
