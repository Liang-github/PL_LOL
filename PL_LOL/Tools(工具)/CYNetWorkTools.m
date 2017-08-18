//
//  CYNetWorkTools.m
//  LOL
//
//  Created by cy on 16/3/11.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "CYNetWorkTools.h"
#import "CYCacheTool.h"


@interface  CYNetWorkTools ()


@end
@implementation CYNetWorkTools

static CYNetWorkTools *instance;
+ (instancetype)netManager
{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *url = [NSURL URLWithString:baseUrl];
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        instance = [[self alloc] initWithBaseURL:url sessionConfiguration:config];
        
        instance.responseSerializer = [AFHTTPResponseSerializer serializer];
        /**数据响应格式,数据接收内容形似*/
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/x-javascript", nil];
    });
    
    return instance;
}

- (void)requestMethod:(CYRequestMethod)Method urlString:(NSString *)url  parameters :(NSDictionary *)parameters  controllerName:(NSString *)controllerName finished:(void(^)(id response))finished failured:(void(^)(NSError *error))failured
{
    WeakSelf
    NSData *data = [[CYCacheTool shareManeger] slectDataFromSqilteWithParamer:controllerName];
    NSDictionary *dictarry = [self dataChanggeDictionary:data];
    if (data.length) {
        if (finished) {
            finished(dictarry);
        }
    }else {
        [instance GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            if (finished) {
                if (controllerName.length) {
                    [[CYCacheTool shareManeger] addJsondata:responseObject name:controllerName];
                }
                NSDictionary *dict = [weakSelf dataChanggeDictionary:responseObject];
                finished(dict);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failured) {
                failured(error);
            }
        }];
        
        
        
    }
}

/** 数据刷新方法 */
- (void)loadNewDataWithUrlString:(NSString *)url   controllerName:(NSString *)controllerName finished:(void(^)(id response))finished failured:(void(^)(NSError *error))failured
{
    WeakSelf
    [instance GET:url
       parameters:nil
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              [weakSelf updateDateFromNewData:responseObject name:controllerName];
              NSDictionary *dict = [weakSelf dataChanggeDictionary:responseObject];
              if (finished) {
                  finished(dict);
              }
    
}
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              if (failured) {
                  failured(error);
              }
}];
}

/**
 *  数据更新处理
 *
 *  @param datadict 数据字典
 *  @param name     控制器名
 *
 *  @return 新数据
 */
- (void)updateDateFromNewData:(NSData *)data name:(NSString *)name
{
    
    NSDictionary *dict = [self dataChanggeDictionary:data];
    NSData *oldData = [[CYCacheTool shareManeger] slectDataFromSqilteWithParamer:name];
    NSDictionary *oldDict = [self dataChanggeDictionary:oldData];
    if(oldDict.count == 0){
        return;
    }
    NSMutableArray *oldArr = [NSMutableArray dictSelectFromKey:oldDict[@"list"]];
    NSMutableArray *newArr = [NSMutableArray dictSelectFromKey:dict[@"list"]];
    
    
    NSInteger oldMaxArticle_id = [[oldArr valueForKeyPath:@"@max.intValue"] intValue];
    NSInteger newMaxArticle_id = [[newArr valueForKeyPath:@"@max.intValue"] intValue];
    if (newMaxArticle_id > oldMaxArticle_id) {
        [[CYCacheTool shareManeger] updateDataFromControllerName:name newData:data];
    }
    
   
    
}


/**
 *  数据解析处理
 */
- (NSDictionary *)dataChanggeDictionary:(NSData *)data
{

    if (data.length == 0) {
        return nil;
    }
    NSString *sting = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    if ([sting  containsString:@"\r\n"] ) {
        sting = [sting stringByReplacingOccurrencesOfString:@"\r\n" withString:@""];
    }
    NSError *error = [NSError errorWithDomain:@"数据解析错误" code:1000 userInfo:nil];
    NSData *newdata = [sting dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:newdata options:kNilOptions error:&error];
    if (dict.count == 0) {
        dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    }
    return dict;
}
@end
