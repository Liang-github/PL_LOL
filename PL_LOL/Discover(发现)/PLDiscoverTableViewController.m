//
//  PLDiscoverTableViewController.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/18.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLDiscoverTableViewController.h"
#import "VistorView.h"
#import "CYNetWorkTools.h"
#import "DiscoverModel.h"
#import "TeamModel.h"
#import <MJExtension.h>
#import "PLDiscoverCell.h"
#import "PLBaseClubController.h"
#import "PLView.h"
#import "PLSectionCell.h"
#import "PLTeamScrollView.h"

@interface PLDiscoverTableViewController ()<UITableViewDataSource, UITableViewDelegate, PLSectionCellDelegate, PLTeamScrollViewDelegate>

@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, strong) NSArray *teamArr;
@property (nonatomic, assign, getter=isOpen) BOOL open;
@property (nonatomic, assign) NSInteger currentClickIndex;

@end

static NSString *const ID = @"customCell";
static NSString *const Cell = @"PLCell";
@implementation PLDiscoverTableViewController
- (void)loadView {
    self.login ? [super loadView] : [self setVistorView];
}
//加载访客视图
- (void)setVistorView {
    self.view = [[VistorView alloc] init];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //去除导航栏下方的横线
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    [navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar_bg_for_seven"] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [navigationBar setShadowImage:[UIImage new]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!self.login) {
        return;
    }
    self.navigationItem.title = @"发现";
    [self sendRequest];
    [self setupTableView];
    
    if (self.teamArr.count) {
        [self addTeamHeadView];
    }
}
-(void)setupTableView {
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds];
    table.dataSource = self;
    table.delegate = self;
    table.separatorInset = UIEdgeInsetsZero;
    table.backgroundColor = kColor(231, 231, 231);
    [self.view addSubview:table];
    self.table = table;
    
    [table registerClass:[PLDiscoverCell class] forCellReuseIdentifier:ID];
    [table registerClass:[PLSectionCell class] forCellReuseIdentifier:Cell];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = kColor(36, 45, 55);
    view.width = self.view.width;
    view.height = self.view.height;
    view.y = -self.view.height;
    [table addSubview:view];
    
    //删除多余行
    table.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}
- (void)addTeamHeadView {
    PLTeamScrollView *view = [[PLTeamScrollView alloc] init];
    view.teamArr = self.teamArr;
    view.delegate = self;
    view.height = 140;
    self.table.tableFooterView = view;
}
- (void)teamIconClickWithTag:(NSInteger)tag {
    PLBaseClubController *vc = [[PLBaseClubController alloc] init];
    vc.item = self.teamArr[tag];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - 发送网络请求
- (void)sendRequest
{
    WeakSelf;
    //进页面地址
    NSString *urlStr = @"http://qt.qq.com/static/pages/news/discovery/c21_index.js";
    [[CYNetWorkTools netManager] requestMethod:CYRequestMethodGet
                                     urlString:urlStr
                                    parameters:nil
                                controllerName:self.navigationItem.title
                                      finished:^(id response) {
                                          
                                          self.dataArr = [DiscoverModel mj_objectArrayWithKeyValuesArray:response[@"list"]];
                                          [self.table reloadData];
                                          
                                      } failured:^(NSError *error) {
                                          MYLog(error);
                                      }];
    //team地址
    NSString *teamUrl = @"http://qt.qq.com/php_cgi/lol_mobile/club/varcache_team_entrancev2.php?version=$@&plat=ios";
    [[CYNetWorkTools netManager] requestMethod:CYRequestMethodGet
                                     urlString:teamUrl
                                    parameters:nil
                                controllerName:@"战队"
                                      finished:^(id response) {
                                          self.teamArr = [TeamModel mj_objectArrayWithKeyValuesArray:response[@"clubs"]];
                                          
                                          [weakSelf addTeamHeadView];
                                          
                                          
                                      } failured:^(NSError *error) {
                                          MYLog(error);
                                      }];
    
}
#pragma mark - 模型处理
- (DiscoverModel *)correctDataSection_index:(NSString *)section_index pos_index:(NSString *)pos_index {
    DiscoverModel *model = nil;
    for (int i = 0; i < self.dataArr.count; ++i) {
        DiscoverModel *item = self.dataArr[i];
        if ([item.section_index isEqualToString:section_index] && [item.pos_index isEqualToString:pos_index]) {
            model = item;
        }
    }
    return model;
}
- (NSArray *)firstSection {
    NSMutableArray *arr = [NSMutableArray array];
    
    DiscoverModel *item1 = [self correctDataSection_index:@"0" pos_index:@"1"];
    [arr addObject:item1];
    DiscoverModel *item2 = [self correctDataSection_index:@"0" pos_index:@"2"];
    [arr addObject:item2];
    DiscoverModel *item3 = [self correctDataSection_index:@"0" pos_index:@"3"];
    [arr addObject:item3];
    
    return arr;
}
- (NSArray *)secondSection {
    NSMutableArray *arrM = [NSMutableArray array];
    
    DiscoverModel *item1 = [self correctDataSection_index:@"0" pos_index:@"0"];
    [arrM addObject:item1];
    DiscoverModel *item2 = [self correctDataSection_index:@"2" pos_index:@"0"];
    [arrM addObject:item2];
    DiscoverModel *item3 = [self correctDataSection_index:@"3" pos_index:@"0"];
    [arrM addObject:item3];
    DiscoverModel *item4 = [self correctDataSection_index:@"4" pos_index:@"3"];
    [arrM addObject:item4];
    DiscoverModel *item5 = [self correctDataSection_index:@"5" pos_index:@"0"];
    [arrM addObject:item5];
    return arrM;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 5;
    } else {
        return 0;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        PLSectionCell *myCell = [tableView dequeueReusableCellWithIdentifier:Cell];
        myCell.delegate = self;
        if (self.dataArr) {
            myCell.itemArr = [self firstSection];
        }
        myCell.selectionStyle = 0;
        return myCell;
    } else if (indexPath.section == 1) {
        PLDiscoverCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (self.dataArr) {
            NSArray *arr = [self secondSection];
            DiscoverModel *item = arr[indexPath.row];
            cell.item = item;
        }
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 90;
    } else if (indexPath.section == 1) {
        return 44;
    } else {
        return 0;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == _currentClickIndex) {
        _open = !_open;
    } else {
        _open = YES;
    }
    _currentClickIndex = indexPath.row;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
- (void)cellIconViewClickWithTag:(NSInteger)viewTag {
    LDLog(viewTag)
}
@end
