//
//  HZYHotelPriceViewController.m
//  世界辣么大
//
//  Created by dllo on 16/3/9.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYHotelPriceViewController.h"
#import "HZYHotelTwoTableViewCell.h"
#import "HZYNetWorkTool.h"
#import <UIImageView+WebCache.h>
#import "HZYWebOne.h"
@interface HZYHotelPriceViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) UITableView *tabView;
@property (nonatomic, retain) NSMutableArray *array;
@end

@implementation HZYHotelPriceViewController
- (NSMutableArray *)array{
    if (_array == nil) {
        _array = [NSMutableArray array];
    }return _array;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"fan3.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStylePlain target:self action:@selector(GG)];
    self.navigationItem.leftBarButtonItem = item;
    [self creat];
    [self creatData];

}
- (void)GG{
    [self.navigationController popToRootViewControllerAnimated:YES];

}
- (void)creatData{

    [HZYNetWorkTool getWithURL:[NSString stringWithFormat:@"http://open.qyer.com/qyer/hotel/search_list?checkin=2016-%d-%d&checkout=2016-%d-%d&city_id=%@&client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&from_key=app_ios_index_top&lat=38.88245750232948&lon=121.5395768176375&oauth_token=7ed3ae5c6cd23159f4cee9adc1f5fe55&orderby=1&page=2&track_app_version=6.8.4&track_deviceid=F1CC1DC7-CC07-473E-BE71-407A9CED5975&track_user_id=7562345&v=1", self.s1,self.s2,self.s3, self.s4 ,self.model.ID] parameter:nil httpHeader:nil responseType:ResponseTypeJSON progress:^(NSProgress *progress) {
    } sucess:^(id result) {
        NSLog(@"%@", result);
        NSDictionary *dic = [result objectForKey:@"data"];
        NSMutableArray *arra = [dic objectForKey:@"hotel"];
        NSLog(@"%@",arra);
        for (NSDictionary *dict in arra) {
            HZYhotel *mode = [[HZYhotel alloc] initWithDic:dict];
            [self.array addObject:mode];
            
        }
        [self.tabView reloadData];
    } fail:^(NSError *error) {
    
    }];
}
- (void)creat{
    self.tabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 49) style:UITableViewStylePlain];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    [self.view addSubview:self.tabView];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HZYWebOne *web = [[HZYWebOne alloc] init];
    web.link = [self.array[indexPath.row] link];
    [self.navigationController pushViewController:web animated:YES];
   

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.view.frame.size.height / 6;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  static NSString *ID = @"cell";
    HZYHotelTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HZYHotelTwoTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    [cell.imagV sd_setImageWithURL:[NSURL URLWithString:[self.array[indexPath.row] photo]]];
    cell.label1.text = [self.array[indexPath.row] cnname];
    cell.label1.font = [UIFont systemFontOfSize:15];
    cell.label2.text = [self.array[indexPath.row] enname];
    cell.label2.font = [UIFont systemFontOfSize:14];
    cell.label2.textColor = [UIColor grayColor];
    cell.imag.image = [UIImage imageNamed:@"weizhi"];
    cell.label3.text = [self.array[indexPath.row] star];
    cell.label3.font = [UIFont systemFontOfSize:14];
    cell.label3.textColor = [UIColor orangeColor];
    cell.label4.text = [self.array[indexPath.row] area_name];
    cell.label4.font = [UIFont systemFontOfSize:14];
    if ([self.array[indexPath.row] ranking].stringValue.length > 2) {
    NSString *str = [[self.array[indexPath.row] ranking].stringValue substringWithRange:NSMakeRange(0, 3)];
    cell.label5.text = [str stringByAppendingString:@"分"];
    }else{
        cell.label5.text = [[self.array[indexPath.row] ranking].stringValue stringByAppendingString:@"分"];
    }cell.label5.textAlignment = NSTextAlignmentRight;
    cell.label6.textColor = [UIColor orangeColor];
    cell.label6.font = [UIFont systemFontOfSize:18];
    cell.label6.text = [[self.array[indexPath.row] price].stringValue stringByAppendingString:@"元起"];
    cell.label6.textAlignment = NSTextAlignmentRight;
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
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
