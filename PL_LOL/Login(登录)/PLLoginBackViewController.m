//
//  PLLoginBackViewController.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/18.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLLoginBackViewController.h"
#import "PLLoginViewController.h"
#import "TabBarController.h"
#import <UIImageView+WebCache.h>
@interface PLLoginBackViewController ()

@property (nonatomic, strong) UIImageView *backImage;
@end

@implementation PLLoginBackViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _backImage = [[UIImageView alloc] init];
    _backImage.frame = self.view.frame;
    [_backImage sd_setImageWithURL:[NSURL URLWithString:StartAppImageUrl] placeholderImage:[UIImage imageNamed:@"login_bkg"]];
    [self.view addSubview:_backImage];
    
    NSDictionary *accessToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"acounMessage"];
    if (!accessToken.count) {
        PLLoginViewController *vc = [[PLLoginViewController alloc] init];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController pushViewController:vc animated:YES];
        });
    } else {
        TabBarController *tab = [[TabBarController alloc] init];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController pushViewController:tab animated:YES];
        });
    }
}



@end
