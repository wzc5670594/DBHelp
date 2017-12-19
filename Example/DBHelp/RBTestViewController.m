//
//  RBTestViewController.m
//  DBHelp_Example
//
//  Created by Ray Boring on 2017/12/18.
//  Copyright © 2017年 wzc5670594. All rights reserved.
//

#import "RBTestViewController.h"


//#import <DBHelp/NSValueBinding.h>

#import <DBHelp/SQLTable.h>

//#import <DBHelp/SQLSelection.h>

@interface RBTestViewController ()

@end

@implementation RBTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CFAbsoluteTime t = CFAbsoluteTimeGetCurrent();
    
    SQLTable *table = [SQLTable table:@"tagg"];
    
    table.create.newColumn(@"id", eSQLBindTypeInteger).primaryKey();
    table.create.newColumn(@"name", eSQLBindTypeText).unique().notNull();
    table.create.column(@"age", eSQLBindTypeInteger);
    table.create.newColumn(@"company", eSQLBindTypeText).defaultValue(@"home");
    table.create.newColumn(@"createtime", eSQLBindTypeReal);
    
    ///创建表
    NSLog(@"%@", table.create.sqlExpression());
    
    ///select
    table.select.where(@"age").equal(@28);
    
    NSLog(@"%@", table.select.sqlExpression());
    
    table.select.column(@"1").column(@"4").where(@"2").between(@"1", @"3");
    
    NSLog(@"%@", table.select.sqlExpression());
    
    
    ///insert
    table.insert.columns(@"id", @"name", @"age", @"company", @"createtime", nil).values([NSNull null], @"Ray", @28, [NSNull null], @4145123.4, nil);
    
    NSLog(@"%@", table.insert.sqlExpression());
    
    
    ///update
    table.update.set(@"4", @"update").set(@"56", @4);
    NSLog(@"%@", table.update.sqlExpression());
    
    table.update.set(@"4", @"update").set(@"56", @778).where(@"4").equal(@"f");
    NSLog(@"%@", table.update.sqlExpression());
    
    
    
    CFAbsoluteTime tz = CFAbsoluteTimeGetCurrent();
    
    NSLog(@"%f", tz - t);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc {
    NSLog(@"%@", self);
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
