//
//  AppDelegate.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/17.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "AppDelegate.h"
#import "NavigationController.h"
#import "PLLoginViewController.h"
#import <SDWebImageManager.h>
#import <UMSocial.h>
#import <UMSocialSinaSSOHandler.h>
#import <UMSocialWechatHandler.h>
#import <UMSocialQQHandler.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [UMSocialData setAppKey:umAppKeyString];
    
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:sinaAppKeyString secret:sinaAppSecretString RedirectURL:sinaBackUrlString];
    [UMSocialWechatHandler setWXAppId:@"wx14a9804eb639c89e" appSecret:@"0e4e64b0ef71cfc2bebd1c64e993555c" url:@"http://www.umeng.com/social"];
    [UMSocialQQHandler setQQWithAppId:tecentAppIDString appKey:tecentAppKey url:@"http://www.umeng.com/social"];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    PLLoginViewController *vc = [[PLLoginViewController alloc] init];
    NavigationController *nav = [[NavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [UMSocialSnsService handleOpenURL:url];
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return  [UMSocialSnsService handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    return result;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
