//
//  NavigationController.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/17.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation NavigationController

+ (void)initialize {
    UINavigationBar *bar = [UINavigationBar appearance];
    
    bar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithRed:219/255.0 green:170/255.0 blue:117/255.0 alpha:1],NSFontAttributeName:[UIFont systemFontOfSize:18]};
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpScreenGesture];
}

- (void)setUpScreenGesture {
    id target = self.interactivePopGestureRecognizer.delegate;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    pan.delegate = self;
    [self.view addGestureRecognizer:pan];
    self.interactivePopGestureRecognizer.enabled = NO;
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem customBarButtonItem:@"nav_btn_back_tiny_normal" selecImage:@"nav_btn_back_tiny_pressed" addTarget:self action:@selector(dismissController)];
    }
    [super pushViewController:viewController animated:animated];
}
- (void)dismissController {
    [self popViewControllerAnimated:YES];
}
@end
