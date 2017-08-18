//
//  PLClubNowController.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/18.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLClubNowController.h"
#import "CYNetWorkTools.h"
#import <MJExtension.h>
#import "UserInfoModel.h"
#import "PLUserCell.h"
#import "TeamModel.h"
#import "PLPersonController.h"
@interface PLClubNowController ()
//成员数组
@property (nonatomic, strong) NSArray *userArr;
@end

static NSString *const ID = @"userCell";

@implementation PLClubNowController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"现役队员";
    self.tableView.separatorInset = UIEdgeInsetsZero;
    
    [self.tableView registerClass:[PLUserCell class] forCellReuseIdentifier:ID];
    self.tableView.estimatedRowHeight = 100l;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self sendRequest];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}
//发送网络请求
- (void)sendRequest {
    //现役队员详情介绍
    NSString *url = @"http://qt.qq.com/php_cgi/lol_mobile/club/varcache_team_members.php";
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"id"] = self.item.id;
    dict[@"plat"] = @"ios";
    dict[@"version"] = @3;
    
    NSString *controllerName = [NSString stringWithFormat:@"%@%@",self.item.name,self.title];
    [[CYNetWorkTools netManager] requestMethod:CYRequestMethodGet
                                     urlString:url
                                    parameters:dict
                                controllerName:controllerName
                                      finished:^(id response) {
                                          self.userArr = [UserInfoModel mj_objectArrayWithKeyValuesArray:response[@"members"]];
                                          
                                          [self.tableView reloadData];
                                      } failured:^(NSError *error) {
                                          MYLog(error);
                                      }];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.userArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PLUserCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.item = self.userArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PLPersonController *vc = [[PLPersonController alloc] init];
    vc.item = self.userArr[indexPath.row];
    vc.model = self.item;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
