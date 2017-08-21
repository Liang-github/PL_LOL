//
//  PLMessageTableViewController.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/21.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLMessageTableViewController.h"
#import "PLMessageItem.h"
#import "PLScrollView.h"
#import "PLWebViewController.h"
#import <MJExtension.h>
@interface PLMessageTableViewController ()<PLScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *topArray;

@end

@implementation PLMessageTableViewController
- (NSString *)netUrl {
    PLListItem *item = self.listAPI[0];
    return item.urlString;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadScrollData];
}

- (void)loadScrollData {
    PLScrollView *scroll = [[PLScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 180)];
    scroll.backgroundColor = [UIColor redColor];
    scroll.delegate = self;
    self.tableView.tableHeaderView = scroll;
    WeakSelf;
    PLListItem *item = self.listAPI.lastObject;
    [[CYNetWorkTools netManager] requestMethod:CYRequestMethodGet urlString:item.urlString parameters:nil controllerName:item.title finished:^(id response) {
        weakSelf.topArray = [PLMessageItem mj_objectArrayWithKeyValuesArray:response[@"list"]];
        NSMutableArray *textArrM = [NSMutableArray array];
        NSMutableArray *urlArrM = [NSMutableArray array];
        for (int i = 0; i < weakSelf.topArray.count; ++ i) {
            PLMessageItem *item = weakSelf.topArray[i];
            [urlArrM addObject:item.image_url_big];
            [textArrM addObject:item.title];
        }
        scroll.urlStrings = urlArrM;
        scroll.texts = textArrM;
    } failured:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}
#pragma mark - 轮番滚动的点击事件
- (void)plScrollView:(PLScrollView *)scrollView didClickItemAtIndex:(NSInteger)index {
    PLWebViewController *web = [[PLWebViewController alloc] init];
    web.item = self.topArray[index];
    [self.navigationController pushViewController:web animated:YES];
}
@end
