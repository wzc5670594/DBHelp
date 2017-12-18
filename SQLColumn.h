//
//  SQLColumn.h
//  DBHelp
//
//  Created by Ray on 2017/12/17.
//

#import <Foundation/Foundation.h>

#import "SQLBinding.h"

#import "SQLPreparation.h"

@interface SQLColumn : NSObject<SQLPreparation>


/**
 创建

 @param column 列名
 @param table 表名
 @return column
 */
+ (instancetype)column:(NSString *)column table:(NSString *)table;


/**
 创建
 
 @param column 列名
 @param table 表名
 @param bind 绑定的值类型
 @return column
 */
+ (instancetype)creatColumn:(NSString *)column bind:(eSQLBindType)bind table:(NSString *)table;



/**
 需要绑定的值类型

 @param type 值类型
 @return 值类型string
 */
+ (NSString *)transType:(eSQLBindType)type;


///输出需要的sql语句
+ (NSString *)getSqlExpression:(NSArray<SQLColumn *> *)columnSet withBind:(BOOL)withBind;


@end