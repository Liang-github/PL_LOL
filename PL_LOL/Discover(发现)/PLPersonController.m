//
//  PLPersonController.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/18.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLPersonController.h"
#import <UIImageView+WebCache.h>
#import "PLBaseClubController.h"

@interface PLPersonController ()

@end

@implementation PLPersonController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    
    self.title = @"战队成员";
    [self.icon sd_setImageWithURL:[NSURL URLWithString:self.item.iconUrl] placeholderImage:[UIImage imageNamed:@"default_hero_head"]];
    self.name.text = self.item.name;
    self.fansCount.text = [NSString stringWithFormat:@"人气值"];
    self.userInfo.text = self.item.intro;
}

- (void)setUI {
    self.view.backgroundColor = kColor(223, 223, 223);
    
    _icon = [[UIImageView alloc] init];
    _icon.frame = CGRectMake((kScreenW - 49)/2, 30, 49, 49);
    [self.view addSubview:_icon];
    
    _name = [[UILabel alloc] init];
    _name.frame = CGRectMake((kScreenW - 50)/2, 99, 50, 20);
    _name.textColor = kColor(76, 131, 183);
    [self.view addSubview:_name];
    
    _clubBgView = [[UIImageView alloc] init];
    _clubBgView.frame = CGRectMake((kScreenW - 220)/2, 139, 220, 34);
    _clubBgView.image = [UIImage imageNamed:@"club_mem_bg"];
    [self.view addSubview:_clubBgView];
    
    _userInfo = [[UILabel alloc] init];
    _userInfo.frame = CGRectMake(10, 193, kScreenW - 20, 20);
    [self.view addSubview:_userInfo];
    
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(0, kScreenH - 44, kScreenW, 44);
    btn.backgroundColor = [UIColor whiteColor];
    [btn setTitleColor:[UIColor colorWithRed:76/255.0 green:131/255.0 blue:183/255.0 alpha:1] forState:0];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"查看他的战队" forState:0];
    [self.view addSubview:btn];
    
    _fansCount = [[UILabel alloc] init];
    _fansCount.frame = CGRectMake((kScreenW - 40)/2, 147, 40, 18);
    _fansCount.textColor = [UIColor whiteColor];
    _fansCount.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_fansCount];
}
- (void)btnClick {
    PLBaseClubController *vc = [[PLBaseClubController alloc] init];
    vc.item = self.model;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
