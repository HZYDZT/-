//
//  SqliteFmdbTool.m
//  UI_21FMDB
//
//  Created by dllo on 16/1/20.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "SqliteFmdbTool.h"
#import "FMDB.h"
#import "HZYpriceModel.h"

@implementation SqliteFmdbTool
// 创建数据库对象  db 就是一个数据库
static FMDatabase *db;
//这个方法是初始化的时候就会调用的方法 , 父类的方法 不需要super
+ (void)initialize{
    //获取数据库路径           搜索范围目录  收索沙盒路径 收索范围目录 返回绝对路径
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0] stringByAppendingString:@"hzy1.sqlite"];
    //根据路径创建数据库
    db= [FMDatabase databaseWithPath:filePath];
    //打开数据库
    [db open];
    //创建学生表  id interger primary key  的意识就是返回后面本身的名 而不是本身
    NSString *creatTableSql = @" CREATE TABLE IF NOT EXISTS t_hzy1(id integer PRIMARY KEY , title text , photo text)";
    //执行sql语句  是表中有这两个语句的属性
    [db executeUpdate:creatTableSql];
    //查询操作调用下面这个方法.传sql语句
    [db executeQuery:nil];
}
+ (void)addStudent:(HZYpriceModel *)model
               mod:(HZYgenduoModel *)mod{
    if (model) {
        [db executeUpdateWithFormat:@"INSERT INTO t_hzy1(title, photo) VALUES (%@, %@)", model.title, model.photo];
    }
    if (mod) {
        [db executeUpdateWithFormat:@"INSERT INTO t_hzy1(title, photo) VALUES (%@, %@)", mod.title, mod.pic];
    }
}
+ (NSMutableArray *)seleStudent{
    NSMutableArray *array = [NSMutableArray array];
    FMResultSet *setRe = [db executeQuery:@"SELECT *FROM t_hzy1"];
    while (setRe.next) {
        NSString *title =  [setRe stringForColumn:@"title"];
        NSString *photo = [setRe stringForColumn:@"photo"];
        HZYpriceModel *model = [[HZYpriceModel alloc] init];
        NSString *title1 =  [setRe stringForColumn:@"title"];
        NSString *pic = [setRe stringForColumn:@"pic"];
        HZYgenduoModel *mod = [[HZYgenduoModel alloc] init];
        if (model) {
        model.title = title;
        model.photo = photo;
        [array addObject:model];
        }
         else if (mod) {
            mod.title = title1;
            mod.pic = pic;
            [array addObject:mod];
        }
    }
    return array;
}
+ (void)deleteHeadModel:(HZYpriceModel *)model
                    mod:(HZYgenduoModel *)mod{
    if (model) {
    [db executeUpdate:@"delete from t_hzy1 where title = ?", model.title];
    [db executeUpdate:@"delete from t_hzy1 where photo = ?", model.photo];
    }
    if (mod) {
    [db executeUpdate:@"delete from t_hzy1 where title = ?", mod.title];
    [db executeUpdate:@"delete from t_hzy1 where photo = ?", mod.pic];
    }
}
@end
