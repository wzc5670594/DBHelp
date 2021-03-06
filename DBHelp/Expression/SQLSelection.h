//
//  SQLSelection.h
//  DBHelp
//
//  Created by Ray Boring on 2017/12/15.
//

#import "SQLExpression.h"

#import "SQLOrderBy.h"

@interface SQLSelection : SQLSearchExpression

+ (instancetype)select:(NSString *)tableName;

- (SQLSelection *(^)(NSString *))column;

/** 别名 */
- (SQLSelection *(^)(NSString *column, NSString *alias))columnAsAlias;


@end

@interface SQLSelection (Count)

- (SQLSelection *)count;

@end

@interface SQLSelection (OrderBy)

/** 排序 */
- (SQLOrderBy *(^)(NSString *column))orderBy;

@end
