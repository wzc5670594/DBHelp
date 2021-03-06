//
//  SQLTable.h
//  DBHelp
//
//  Created by Ray Boring on 2017/12/15.
//

#import <Foundation/Foundation.h>


#import "SQLCreation.h"
#import "SQLSelection.h"
#import "SQLInsert.h"
#import "SQLUpdate.h"
#import "SQLDelete.h"



#import "NSValueBinding.h"

@interface SQLTable : NSObject


/**
 表名

 @param table 表名
 @return 表
 */
+ (instancetype)named:(NSString *)table;

@end


@interface SQLTable (Creation)

/** 创建 */
@property (nonatomic, strong, readonly)SQLCreation *create;

@end


@interface SQLTable (Select)

/** 查询 */
@property (nonatomic, strong, readonly)SQLSelection *select;

@end

@interface SQLTable (Insert)

/** 插入 */
@property (nonatomic, strong, readonly)SQLInsert *insert;

@end

@interface SQLTable (Update)

/** 更新 */
@property (nonatomic, strong, readonly)SQLUpdate *update;

@end


@interface SQLTable (Delete)

/** 删除 */
@property (nonatomic, strong, readonly)SQLDelete *deleteColumn;

@end

@interface SQLTable (Alter)

/** 重命名 */
@property (nonatomic, strong, readonly)SQLAlter *alter;

@end





