//
//  SQLUpdate.h
//  DBHelp
//
//  Created by Ray Boring on 2017/12/18.
//

#import "SQLExpression.h"



@interface SQLUpdate : SQLSearchExpression

+ (instancetype)update:(NSString *)tableName;

- (SQLUpdate *(^)(NSString *column, id<SQLValueBinding> value))set;


@end
