//
//  MineTwoVc.m
//  世界辣么大
//
//  Created by dllo on 16/3/2.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "MineTwoVc.h"
#import <UIImageView+WebCache.h>
#import "SqliteFmdbTool.h"
#import "HZYWebController.h"
@interface MineTwoVc ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic ,retain) UITableView *tabView;
@property (nonatomic ,retain) NSString *str;
@property (nonatomic ,retain) NSMutableArray *arr;
@end
@implementation MineTwoVc
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.arr = [NSMutableArray array];
    self.arr = [SqliteFmdbTool seleStudent];
    [self creatTabView];
}
- (void)creatTabView{
    self.tabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStylePlain];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    [self.view addSubview:self.tabView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jum1) name:@"aada" object:nil];
    
}
- (void)jum1{
    NSLog(@"adasdas");       
   self.arr = [SqliteFmdbTool seleStudent];
   [self.tabView reloadData];
}


- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    [self.tabView setEditing:editing animated:animated];
    
}
//cell可以被编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
//告诉编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{

        return 1;
}
//实现删除和添加业务的逻辑
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        [SqliteFmdbTool  deleteHeadModel:self.arr[indexPath.row]  mod:nil];
        [self.arr removeObjectAtIndex:indexPath.row];
        
        [self.tabView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arr.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [self.arr[indexPath.row] title];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[self.arr[indexPath.row] photo]]];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
