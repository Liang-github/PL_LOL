//
//  PLLoginViewController.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/18.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLLoginViewController.h"
#import "TabBarController.h"
#import "PLOtherLoginViewController.h"
#import <UIImageView+WebCache.h>
#import "CYShareTool.h"

@interface PLLoginViewController ()

@property (nonatomic, strong) UIImageView *backImage;
@property (nonatomic, strong) UIImageView *loginBack;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIImageView *loginLogoImage;

@property (nonatomic, strong) UIButton *tentcentLoginBtn;
@property (nonatomic, strong) UIButton *vistorBtn;
@property (nonatomic, strong) UIButton *otherLoginBtn;
@end

@implementation PLLoginViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    for (UIGestureRecognizer *nizer in self.navigationController.view.gestureRecognizers) {
        NSString *str = [NSString stringWithFormat:@"%@",NSStringFromClass([nizer class])];
        if ([str isEqualToString:@"UIPanGestureRecognizer"]) {
            [self.navigationController.view removeGestureRecognizer:nizer];
        }
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self.backImage sd_setImageWithURL:[NSURL URLWithString:StartAppImageUrl] placeholderImage:[UIImage imageNamed:@"login_bkg"] options:SDWebImageRefreshCached];
    
}

#pragma mark - 创建UI
- (void)setUI {
    _backImage = [[UIImageView alloc] init];
    _backImage.frame = self.view.frame;
    [self.view addSubview:_backImage];
    
    _loginLogoImage = [[UIImageView alloc] init];
    _loginLogoImage.frame = CGRectMake((kScreenW - 154)/2, 106, 154, 95);
    _loginLogoImage.image = [UIImage imageNamed:@"login_logo"];
    [self.view addSubview:_loginLogoImage];
    
    _tentcentLoginBtn = [[UIButton alloc] init];
    _tentcentLoginBtn.frame = CGRectMake(20, 220, kScreenW - 40, 50);
    [_tentcentLoginBtn setImage:[UIImage imageNamed:@"icon_qq"] forState:UIControlStateNormal];
    [_tentcentLoginBtn setTitle:@"手机QQ快速登录" forState:0];
    [_tentcentLoginBtn setBackgroundImage:[UIImage imageNamed:@"btn_blue_nor"] forState:UIControlStateNormal];
    _tentcentLoginBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_tentcentLoginBtn addTarget:self action:@selector(tentcentBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_tentcentLoginBtn];
    
    _vistorBtn = [[UIButton alloc] init];
    _vistorBtn.frame = CGRectMake(kScreenW - 90, kScreenH - 50, 70, 30);
    _vistorBtn.backgroundColor = [UIColor blackColor];
    [_vistorBtn setTitle:@"游客进入" forState:0];
    _vistorBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_vistorBtn addTarget:self action:@selector(vistorBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_vistorBtn];
    
    _otherLoginBtn = [[UIButton alloc] init];
    _otherLoginBtn.frame = CGRectMake(20, 290, kScreenW - 40, 50);
    [_otherLoginBtn setBackgroundImage:[UIImage imageNamed:@"news_comment_unfold_bg_hover"] forState:UIControlStateNormal];
    [_otherLoginBtn setTitle:@"其他账号登录" forState:0];
    [_otherLoginBtn addTarget:self action:@selector(otherLoginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _otherLoginBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_otherLoginBtn];
}
- (void)otherLoginBtnClick {
    PLOtherLoginViewController *otherVC = [[PLOtherLoginViewController alloc] init];
    [self.navigationController pushViewController:otherVC animated:YES];
}
- (void)vistorBtnClick {
    TabBarController *tab = [[TabBarController alloc] init];
    [self.navigationController pushViewController:tab animated:YES];
}
- (void)tentcentBtnClick {
    [[CYShareTool shareManeger] qqLoginWithViewController:self suceess:^(BOOL result) {
        if (result) {
            [self vistorBtnClick];
        }
    }];
}
@end
