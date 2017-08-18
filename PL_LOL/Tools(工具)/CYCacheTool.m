//
//  CYCacheTool.m
//  LOL
//
//  Created by cy on 16/4/1.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "CYCacheTool.h"
#import "FMDB.h"
@interface  CYCacheTool ()


@property (nonatomic, strong) FMDatabaseQueue *queue;

@end
@implementation CYCacheTool

static CYCacheTool *_manager;
+ (instancetype)shareManeger
{
    
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[super alloc] init];
        
    });


    return _manager;
    
}

- (instancetype)init
{
    if (self = [super init]) {
        NSString *filename = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"data.sqlite"];
        self.queue = [FMDatabaseQueue databaseQueueWithPath:filename];
        [_queue inDatabase:^(FMDatabase *db) {
            [db executeUpdate:@"create table if not exists t_data (id integer primary key autoincrement,name text ,dict blob)"];
        }];
    }
    return self;
}

/**
 *  添加数据
 */
- (void)addJsondata:(NSData *)data name:(NSString *)name
{
    
    [_queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"insert into t_data (name,dict) values (?,?)",name,data];
    }];
}


/**
 *  查询数据
 */
- (NSData *)slectDataFromSqilteWithParamer:(NSString *)controllerName
{
    
    __block NSData *data = nil;
    [_queue inDatabase:^(FMDatabase *db) {
        FMResultSet *result = [db executeQuery:@"select * from t_data where name = (?)limit 1",controllerName];

        while (result.next) {
            
            data = [result dataForColumn:@"dict"];
            
        }
    }];

    return data;
}


/**
 *  更新数据
 */
- (void)updateDataFromControllerName:(NSString *)controllerName newData:(NSData *)newData
{
    [_queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"update t_data set dict=(?) where name=(?)",newData,controllerName];
    }];
}
@end
