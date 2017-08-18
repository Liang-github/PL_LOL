//
//  CYNetWorkTools.h
//  LOL
//
//  Created by cy on 16/3/11.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "AFHTTPSessionManager.h"
typedef enum{
    /** get请求 */
    CYRequestMethodGet = 1,
    /** post请求 */
    CYRequestMethodPost = 2
    
}CYRequestMethod;
@interface CYNetWorkTools : AFHTTPSessionManager
/** 请求工具 */
+ (instancetype)netManager;
/** 网络请求方法 */
- (void)requestMethod:(CYRequestMethod)Method urlString:(NSString *)url  parameters :(NSDictionary *)parameters controllerName:(NSString *)controllerName finished:(void(^)(id response))finished failured:(void(^)(NSError *error))failured;

/** 数据上拉刷新方法 */
- (void)loadNewDataWithUrlString:(NSString *)url   controllerName:(NSString *)controllerName finished:(void(^)(id response))finished failured:(void(^)(NSError *error))failured;
@end
