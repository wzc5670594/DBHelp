//
//  SQLExpression.m
//  DBHelp
//
//  Created by Ray Boring on 2017/12/15.
//

#import "SQLExpression.h"



@implementation SQLExpression

+ (instancetype)expression:(NSString *)tableName {
    SQLExpression *s = [self new];
    s.tableName = tableName;
    return s;
}

- (NSString *(^)(void))sqlExpression {
    return ^() {
        NSCAssert(NO, @"子类实现");
        return @"";
    };
}

- (id (^)(NSString *))table {
    return ^(NSString *t) {
        self.tableName = [t copy];
        return self;
    };
}

- (NSMutableArray<SQLColumn *> *)columnArray {
    if (!_columnArray) {
        _columnArray = [NSMutableArray array];
    }
    return _columnArray;
}

- (id)initWithTable:(NSString *)tableName {
    self = [super init];
    if (self) {
        self.table(tableName);
    }
    return self;
}

- (SQLColumn *)columnExists:(SQLColumn *)column {
    
    __block SQLColumn *exist = nil;
    
    [self.columnArray enumerateObjectsUsingBlock:^(SQLColumn * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.hash == column.hash) {
            exist = obj;
            *stop = YES;
        }
    }];
    
    return exist;
}

- (void)addColumnInQueue:(SQLColumn *)column {
    if (![self columnExists:column]) {
        [self.columnArray addObject:column];
    }
}






@end


#pragma mark -


@interface SQLSearchExpression ()



@end

@implementation SQLSearchExpression

-(SQLWhere *)sqlWhere {
    if (!_sqlWhere) {
        _sqlWhere = [SQLWhere new];
    }
    return _sqlWhere;
}

- (SQLWhere *(^)(NSString *))where {
    return ^(NSString *c) {
        self.sqlWhere.column = c;
        return self.sqlWhere;
    };
}

@end
