//
//  PLSettingController.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/21.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLSettingController.h"
#import "PLFootView.h"
#import "PLLoginBackViewController.h"
#import "NavigationController.h"
#import "PLCacheController.h"
#import "PLSettingCell.h"
#import "SettingItem.h"
#import "SettingArrowItem.h"
#import "SettingGroupItem.h"

@interface PLSettingController ()<PLFootViewDelegate, UIActionSheetDelegate>

@property (nonatomic, strong) NSMutableArray *group;
@end

@implementation PLSettingController
- (NSMutableArray *)group {
    if (_group == nil) {
        _group = [[NSMutableArray alloc] init];
    }
    return _group;
}
- (instancetype)init {
    return [self initWithStyle:UITableViewStyleGrouped];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    PLFootView *view = [[PLFootView alloc] init];
    view.height = 90;
    view.delegate = self;
    self.tableView.tableFooterView = view;
    self.tableView.sectionFooterHeight = 20;
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.contentInset = UIEdgeInsetsMake(-10, 0, 0, 0);
    self.tableView.separatorInset = UIEdgeInsetsZero;
    [self setUpItem];
}
- (void)footViewButtonClickWithView:(UIView *)view button:(UIButton *)button {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"退出登录，你确定吗？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确认" otherButtonTitles:nil];
    [sheet showInView:self.view];
}
- (void)setUpItem {
    NSMutableArray *items1 = [NSMutableArray array];
    SettingItem *item1 = [SettingArrowItem itemWithTitle:@"绑定大区" subTitle:@"艾欧尼亚"];
    [items1 addObject:item1];
    SettingGroupItem *group1 = [SettingGroupItem groupItem:items1];
    [self.group addObject:group1];
    
    SettingItem *item2 = [SettingArrowItem itemWithTitle:@"消息推送设置" subTitle:nil];
    SettingItem *item3 = [SettingArrowItem itemWithTitle:@"隐私设置" subTitle:nil];
    SettingItem *item4 = [SettingArrowItem itemWithTitle:@"省流量" subTitle:@"资讯图片自动下载设置"];
    SettingItem *item5 = [SettingArrowItem itemWithTitle:@"清空缓存" subTitle:@"123"];
    NSArray *arr1 = @[item2,item3,item4,item5];
    SettingGroupItem *group2 = [SettingGroupItem groupItem:arr1];
    [self.group addObject:group2];
    
    SettingItem *item6 = [SettingArrowItem itemWithTitle:@"关于掌盟" subTitle:nil];
    SettingItem *item7 = [SettingArrowItem itemWithTitle:@"意见反馈" subTitle:nil];
    NSArray *arr2 = @[item6,item7];
    SettingGroupItem *group3 = [SettingGroupItem groupItem:arr2];
    [self.group addObject:group3];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"acounMessage"];
        PLLoginBackViewController *vc = [[PLLoginBackViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.group.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    SettingGroupItem *item = self.group[section];
    return item.items.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PLSettingCell *cell = [PLSettingCell cellWithIdentifier:tableView];
    
    SettingGroupItem *group = self.group[indexPath.section];
    SettingItem *item = group.items[indexPath.row];
    cell.item = item;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        PLCacheController *cache = [[PLCacheController alloc] init];
        [self.navigationController pushViewController:cache animated:YES];
    }
}
@end
