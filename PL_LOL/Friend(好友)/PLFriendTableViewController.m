//
//  PLFriendTableViewController.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/21.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLFriendTableViewController.h"
#import "VistorView.h"

@interface PLFriendTableViewController ()

@end

@implementation PLFriendTableViewController
- (void)loadView {
    self.login ? [super loadView] : [self setVistorView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//加载访客视图
- (void)setVistorView {
    self.view = [[VistorView alloc] init];
}

@end
