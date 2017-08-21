//
//  PLBaseViewController.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/21.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLBaseViewController.h"
#import "PLMessageItem.h"
#import "PLMessageCell.h"
#import "PLWebViewController.h"
#import "CYRefreshTool.h"
#import "CYNetWorkTools.h"
#import <MJRefresh.h>
#import <MJExtension.h>
@interface PLBaseViewController ()<UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) NSMutableArray *topArray;
@property (nonatomic, strong) NSDictionary *dict;

@end

@implementation PLBaseViewController

- (NSArray *)listAPI {
    if (_listAPI == nil) {
        _listAPI = [PLListItem mj_objectArrayWithFilename:@"API.plist"];
    }
    return _listAPI;
}
- (NSString *)controllerName {
    return self.title;
}
static NSString *const ID = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载数据
    [self loadData];
    //刷新
    [self setUpRefresh];
    [self setUpUpRefresh];
    
    [self.tableView registerClass:[PLMessageCell class] forCellReuseIdentifier:ID];
    self.tableView.separatorInset = UIEdgeInsetsZero;
}

#pragma mark - 下拉刷新
- (void)setUpRefresh {
    WeakSelf;
    [CYRefreshTool loadDownRefreshWithUrl:self.netUrl tableView:self.tableView name:self.title Complet:^(id endRespose) {
        weakSelf.array = [PLMessageItem mj_objectArrayWithKeyValuesArray:endRespose[@"list"]];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}
#pragma mark - 上拉刷新
- (void)setUpUpRefresh {
    WeakSelf;
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [[CYNetWorkTools netManager] loadNewDataWithUrlString:self.dict[@"next"] controllerName:nil finished:^(id response) {
            weakSelf.dict = response;
            [weakSelf.array addObjectsFromArray:[PLMessageItem mj_objectArrayWithKeyValuesArray:response[@"list"]]];
            [weakSelf.tableView.mj_footer endRefreshing];
            [weakSelf.tableView reloadData];
        } failured:^(NSError *error) {
            NSLog(@"%@",error);
            [weakSelf.tableView.mj_footer endRefreshing];
        }];
    }];
    //设置文字
    [footer setTitle:@"向上拉刷新..." forState:MJRefreshStateIdle];
    [footer setTitle:@"松开即可加载更多..." forState:MJRefreshStatePulling];
    [footer setTitle:@"正在加载..." forState:MJRefreshStateRefreshing];
    
    //设置字体
    footer.stateLabel.font = [UIFont boldSystemFontOfSize:14];
    //设置了底部的inset
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 113, 0);
    //设置
    self.tableView.mj_footer = footer;
}
#pragma mark - 进页面刷新请求
- (void)loadData {
    WeakSelf;
    [[CYNetWorkTools netManager] requestMethod:CYRequestMethodGet urlString:self.netUrl parameters:nil controllerName:self.controllerName finished:^(id response) {
        weakSelf.dict = response;
        weakSelf.array = [PLMessageItem mj_objectArrayWithKeyValuesArray:response[@"list"]];
    } failured:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PLMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.item = self.array[indexPath.row];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PLWebViewController *we = [[PLWebViewController alloc] init];
    PLMessageItem *item = self.array[indexPath.row];
    we.item = item;
    [self.navigationController pushViewController:we animated:YES];
}
@end
