//
//  CYRefreshTool.m
//  LOL
//
//  Created by cy on 16/4/3.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "CYRefreshTool.h"
#import "MJRefresh.h"
@implementation CYRefreshTool

/**
 *  下拉刷新
 */
+ (void)loadDownRefreshWithUrl:(NSString *)url tableView:(UITableView *)tableView name:(NSString *)name Complet:(void (^)(id endRespose))complete failure:(void (^)(NSError *))failure
{
    
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        
       [[CYNetWorkTools netManager] loadNewDataWithUrlString:url
                                              controllerName:name
                                                    finished:^(id response) {
                                                  if(response)
                                                      complete(response);
                                                  [tableView.mj_header endRefreshing];
                                              }
                                                    failured:^(NSError *error) {
                                                        if (error) {
                                                            failure(error);
                                                            [tableView.mj_header endRefreshing];
                                                        }
       }];
        
    }];
    [header setTitle:@"向下拉刷新..." forState:MJRefreshStateIdle];
    [header setTitle:@"释放刷新..." forState:MJRefreshStatePulling];
    [header setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    NSArray *imageArr = @[[UIImage imageNamed:@"common_loading_anne_0"],
                          [UIImage imageNamed:@"common_loading_anne_1"],
                          ];
    NSArray *image = @[[UIImage imageNamed:@"common_loading_anne_0"]];
    [header setImages:image forState:MJRefreshStateIdle];
    [header setImages:image forState:MJRefreshStatePulling];
    [header setImages:imageArr forState:MJRefreshStateRefreshing];

    header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:10];

    header.stateLabel.font = [UIFont boldSystemFontOfSize:13];
    tableView.mj_header = header;
    
}


/**
 *  上拉刷新
 */
+ (void)loadUpRefreshWithUrl:(NSString *)url tableView:(UITableView *)tableView Complet:(void (^)(id endRespose))complete failure:(void (^)(NSError *))failure
{
    
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [[CYNetWorkTools netManager] loadNewDataWithUrlString:url
                                               controllerName:nil
                                                     finished:^(id response) {
            if (complete) {
                complete(response);
            }
            [tableView.mj_footer endRefreshing];
        }
                                                     failured:^(NSError *error) {
            if (failure) {
                failure(error);
            }
            [tableView.mj_footer endRefreshing];
                                                     }];
        
        
    }];
    
    // 设置文字
    [footer setTitle:@"向上拉刷新..." forState:MJRefreshStateIdle];
    [footer setTitle:@"松开即可加载更多 ..." forState:MJRefreshStatePulling];
    [footer setTitle:@"正在加载..." forState:MJRefreshStateRefreshing];
    
    // 设置字体
    footer.stateLabel.font = [UIFont boldSystemFontOfSize:14];
    tableView.contentInset = UIEdgeInsetsMake(0, 0, 113, 0);
    tableView.mj_footer = footer;

}
@end
