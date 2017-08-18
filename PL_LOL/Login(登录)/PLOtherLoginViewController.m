//
//  PLOtherLoginViewController.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/18.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLOtherLoginViewController.h"
#import "PLLoginViewController.h"
#import <UIImageView+WebCache.h>
@interface PLOtherLoginViewController ()
@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) UIImageView *loginInputImageView;
@property (nonatomic, strong) UITextField *qqTF;
@property (nonatomic, strong) UITextField *pswTF;

@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *loginBtn;
@end

@implementation PLOtherLoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    
    [_backImageView sd_setImageWithURL:[NSURL URLWithString:StartAppImageUrl] placeholderImage:[UIImage imageNamed:@"login_bkg"]];
    self.navigationController.navigationItem.title = @"其他账号登录";
}
#pragma mark - 创建UI
- (void)setUI {

    _backImageView = [[UIImageView alloc] init];
    _backImageView.frame = self.view.frame;
    [self.view addSubview:_backImageView];
    
    _backBtn = [[UIButton alloc] init];
    _backBtn.frame = CGRectMake(20, 20, 50, 30);
    [_backBtn setBackgroundImage:[UIImage imageNamed:@"nav_btn_back_normal"] forState:UIControlStateNormal];
    [_backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backBtn];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.frame = CGRectMake((kScreenW - 150)/2, 25, 150, 20);
    _titleLabel.text = @"其他账号登录";
    _titleLabel.textColor = [UIColor colorWithRed:208/255.0 green:159/255.0 blue:101/255.0 alpha:1];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_titleLabel];
    
    _loginInputImageView = [[UIImageView alloc] init];
    _loginInputImageView.frame = CGRectMake(20, 200, kScreenW - 40, 90);
    _loginInputImageView.image = [UIImage imageNamed:@"login_input"];
    [self.view addSubview:_loginInputImageView];
    
    _qqTF = [[UITextField alloc] init];
    _qqTF.placeholder = @"QQ号码";
    _qqTF.frame = CGRectMake(0, 0, _loginInputImageView.frame.size.width, 45);
    [_loginInputImageView addSubview:_qqTF];
    
    _pswTF = [[UITextField alloc] init];
    _pswTF.placeholder = @"QQ密码";
    _pswTF.frame = CGRectMake(0, 45, _loginInputImageView.frame.size.width, 45);
    [_loginInputImageView addSubview:_pswTF];
    
    _loginBtn = [[UIButton alloc] init];
    _loginBtn.frame = CGRectMake(20, 300, kScreenW - 40, 40);
    [_loginBtn setBackgroundImage:[UIImage imageNamed:@"btn_blue_nor"] forState:UIControlStateNormal];
    [_loginBtn setTitle:@"登录" forState:0];
    [_loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginBtn];
}
- (void)backBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)loginBtnClick {
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
@end
