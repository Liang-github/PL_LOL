//
//  CYRefreshTool.h
//  LOL
//
//  Created by cy on 16/4/3.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYRefreshTool : NSObject

/**
 *  下拉刷新
 *
 *  @param complete 成功回调
 *  @param failure  失败回调
 */
+ (void)loadDownRefreshWithUrl:(NSString *)url tableView:(UITableView *)tableView name:(NSString *)name Complet:(void(^)(id endRespose))complete failure:(void(^)(NSError *error))failure;


/**
 *  上拉刷新
 *
 *  @param complete 成功回调
 *  @param NSError  错误回调
 */
+ (void)loadUpRefreshWithUrl:(NSString *)url tableView:(UITableView *)tableView Complet:(void(^)(id endRespose))complete failure:(void(^)(NSError *error))failure;

@end
