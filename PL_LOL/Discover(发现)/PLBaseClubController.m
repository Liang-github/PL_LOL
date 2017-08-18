//
//  PLBaseClubController.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/18.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLBaseClubController.h"
#import "PLClubView.h"
#import "CYNetWorkTools.h"
#import "PLClubNowController.h"

@interface PLBaseClubController ()<PLClubViewDelegate>

//成员图片数组
@property (nonatomic, strong) NSArray *menberArr;
@property (nonatomic, strong) PLClubView *customView;

@end

@implementation PLBaseClubController
- (PLClubView *)customView {
    if (_customView == nil) {
        _customView = [[PLClubView alloc] init];
        _customView.item = self.item;
        _customView.urlImages = self.menberArr;
        _customView.delegate = self;
    }
    return _customView;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self sendRequest];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.item.name;
    
    if (self.menberArr.count) {
        [self addCustomView];
    }
}

- (void)sendRequest {
    WeakSelf;
    //战队成员图片地址
    NSString *url = @"http://qt.qq.com/php_cgi/lol_mobile/club/varcache_team_simple.php";
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"id"] = self.item.id;
    dict[@"membernum"] = @10;
    dict[@"plat"] = @"ios";
    dict[@"version"] = @873;
    
    [[CYNetWorkTools netManager] requestMethod:CYRequestMethodGet
                                     urlString:url
                                    parameters:dict
                                controllerName:self.item.name
                                      finished:^(id response) {
                                          self.menberArr =response[@"members"];
                                          [weakSelf addCustomView];
                                      }
                                      failured:^(NSError *error) {
                                          
                                      }];
}
- (void)addCustomView {
    [self.view addSubview:self.customView];
    [self.customView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.right.equalTo(self);
        make.left.equalTo(self);
        make.height.equalTo(@40);
    }];
}
- (void)iconImageViewClickWithTag:(NSInteger)tag model:(TeamModel *)model {
    PLClubNowController *table = [[PLClubNowController alloc] init];
    table.item = model;
    [self.navigationController pushViewController:table animated:YES];
}
@end
