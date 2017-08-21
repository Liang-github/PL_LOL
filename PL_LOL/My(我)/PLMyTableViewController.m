//
//  PLMyTableViewController.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/21.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLMyTableViewController.h"
#import "VistorView2.h"
#import "PLSettingController.h"
#import "HeadView.h"

@interface PLMyTableViewController ()

@end

@implementation PLMyTableViewController
- (void)loadView {
    self.login ? [super loadView] : [self setVistorView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if (!self.login) {
        return;
    }
    [self initlise];
    [self headView];
}

- (void)setVistorView {
    self.view = [[VistorView2 alloc] init];
}
- (void)initlise {
    self.navigationItem.title = @"我";
    if (self.login) {
        self.navigationItem.rightBarButtonItem = [UIBarButtonItem customBarButtonItem:@"personal_setting_nor" selecImage:@"personal_setting_pre" addTarget:self action:@selector(rightBarButtonClick)];
    }
}
- (void)headView {
    HeadView *view = [[HeadView alloc] init];
    view.userModel = self.userModel;
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.height.equalTo(@100);
    }];
}
- (void)rightBarButtonClick {
    PLSettingController *vc = [[PLSettingController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
