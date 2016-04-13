//
//  HZYViewController1.m
//  世界辣么大
//
//  Created by dllo on 16/3/7.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "HZYViewController1.h"

@interface HZYViewController1 ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) UITableView *tableView;

@end

@implementation HZYViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self creat];
}
- (void)creat{
    //....
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, 300, 500) style:UITableViewStylePlain];
    
    UIImageView *imagView = [[UIImageView alloc] initWithFrame:self.view.frame];
    imagView.image = [UIImage imageNamed:@"Lee.jpg"];
    [self.view addSubview:imagView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 13;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *str = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
        cell.backgroundColor = [UIColor clearColor];
        if (indexPath.row == 4) {
            cell.textLabel.text = @"如果可以丶";
            cell.textLabel.textColor = [UIColor colorWithRed:254/255.0 green:116/255.0 blue:249/255.0 alpha:1.0];
        }else if (indexPath.row == 5){
         cell.textLabel.text = @"我想和一个最好的朋友去旅行丶";
            cell.textLabel.textColor = [UIColor colorWithRed:118/255.0 green:229/255.0 blue:249/255.0 alpha:1.0];
        }else if (indexPath.row == 6){
        cell.textLabel.text = @"背包带上单反和足够的钱丶";
            cell.textLabel.textColor = [UIColor colorWithRed:255/255.0 green:195/255.0 blue:61/255.0 alpha:1.0];
        }else if (indexPath.row == 7){
        cell.textLabel.text = @"走走停停丶";
            cell.textLabel.textColor = [UIColor colorWithRed:207/255.0 green:0/255.0 blue:77/255.0 alpha:1.0];
        }else if (indexPath.row == 8){
        cell.textLabel.text = @"记录每一个精彩的瞬间丶";
            cell.textLabel.textColor = [UIColor brownColor];
        }else if(indexPath.row == 9){
        cell.textLabel.text = @"晚上的时候一起谈梦想丶";
            cell.textLabel.textColor = [UIColor colorWithRed:0/255.0 green:189/255.0 blue:54/255.0 alpha:1.0];
        }else if(indexPath.row == 10){
        cell.textLabel.text = @"我们跑丶";
            cell.textLabel.textColor= [UIColor colorWithRed:134/255.0 green:23/255.0 blue:213/255.0 alpha:1.0];
        }else if (indexPath.row == 11){
        cell.textLabel.text = @"笑丶";
            cell.textLabel.textColor = [UIColor colorWithRed:81/255.0 green:130/255.0 blue:55/255.0 alpha:1.0];
        }else if (indexPath.row == 12){
        cell.textLabel.text = @"说着彼此的故事丶";
            cell.textLabel.textColor = [UIColor blueColor];
        }
    }return cell;
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
