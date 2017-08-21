//
//  TabBarController.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/17.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "TabBarController.h"
#import "PLDiscoverTableViewController.h"
#import "PLFriendTableViewController.h"
#import "PLMyTableViewController.h"
#import "NavigationController.h"
#import "PLContaintViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAllController];
    self.tabBar.translucent = NO;
    
}
- (void)setAllController {
    PLContaintViewController *cc = [[PLContaintViewController alloc] init];
    [self setUpOneChildViewController:cc image:[UIImage imageWithRenderingOriginalName:@"tab_icon_news_normal"] selectImage:[UIImage imageWithRenderingOriginalName:@"tab_icon_news_press"] title:@"资讯"];
    
    PLFriendTableViewController *ff = [[PLFriendTableViewController alloc] init];
    [self setUpOneChildViewController:ff image:[UIImage imageWithRenderingOriginalName:@"tab_icon_friend_normal"] selectImage:[UIImage imageWithRenderingOriginalName:@"tab_icon_friend_press"] title:@"好友"];
    
    PLDiscoverTableViewController *dc = [[PLDiscoverTableViewController alloc] init];
    [self setUpOneChildViewController:dc image:[UIImage imageWithRenderingOriginalName:@"tab_icon_quiz_normal"] selectImage:[UIImage imageWithRenderingOriginalName:@"tab_icon_quiz_press"] title:@"发现"];
    
    PLMyTableViewController *my = [[PLMyTableViewController alloc] init];
    [self setUpOneChildViewController:my image:[UIImage imageWithRenderingOriginalName:@"tab_icon_more_normal"] selectImage:[UIImage imageWithRenderingOriginalName:@"tab_icon_more_press"] title:@"我"];
}
- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectImage:(UIImage *)selectImage title:(NSString *)title {
    NavigationController *nav = [[NavigationController alloc] initWithRootViewController:vc];
    nav.tabBarItem.image = image;
    nav.tabBarItem.selectedImage = selectImage;
    nav.tabBarItem.title = title;
    [self addChildViewController:nav];
}

@end
