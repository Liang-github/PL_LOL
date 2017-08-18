//
//  PLVisitorViewController.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/17.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLVisitorViewController.h"
#import "PLLoginViewController.h"
#import <MJExtension.h>
@interface PLVisitorViewController ()

@end

@implementation PLVisitorViewController

- (BOOL)isLogin {
    NSArray *arr = [[NSUserDefaults standardUserDefaults] valueForKey:@"acounMessage"];
    NSArray *userInfo = [TencentAccountModel mj_objectArrayWithKeyValuesArray:arr];
    self.userModel = userInfo.firstObject;
    return arr.count;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}



@end
