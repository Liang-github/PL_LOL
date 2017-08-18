//
//  CYShareTool.h
//  LOL
//
//  Created by cy on 16/4/10.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UMSocial.h"

@interface CYShareTool : NSObject
/**
 *  分享管理者
 *
 */
+ (instancetype)shareManeger;
/**
 *  微信朋友圈分享
 *
 *  @param viewC      分享控制器
 *  @param shareText  分享内容
 *  @param shareImage 分享图片
 *  @param url        回调网址
  *  @param finished   回调Block
 */
- (void)wxShareToTimelineWithViewControll:(UIViewController *)viewC shareText:(NSString *)shareText image:(UIImage *)shareImage url:(NSString *)url finished:(void(^)(NSString *response))finished;
/**
 *  微信好友分享
 *
 *  @param viewC      分享控制器
 *  @param shareText  分享内容
 *  @param shareImage 分享图片
 *  @param title      分享好友标题
 *  @param url        回调网址
 *  @param finished   回调Block
 */
- (void)wxShareToSessionWithViewControll:(UIViewController *)viewC shareText:(NSString *)shareText image:(UIImage *)shareImage title:(NSString *)title url:(NSString *)url finished:(void(^)(NSString *response))finished;
/**
 *  新浪微博分享
 *
 *  @param viewC      分享控制器
 *  @param shareText  分享内容
 *  @param shareImage 分享图片
 *  @param finished   回调Block
 */
- (void)wbShareWithViewControll:(UIViewController *)viewC shareText:(NSString *)shareText image:(UIImage *)shareImage finished:(void(^)(NSString *response))finished;
/**
 *  QQ分享
 *
 *  @param viewC      分享控制器
 *  @param shareText  分享内容
 *  @param shareImage 分享图片
 *  @param url        回调网址
 *  @param url        分享标题
 *  @param finished   回调Block
 */
- (void)qqShareToQQWithViewControll:(UIViewController *)viewC shareText:(NSString *)shareText image:(UIImage *)shareImage url:(NSString *)url shareTitle:(NSString *)title finished:(void(^)(NSString *response))finished;
/**
 *  QQ空间分享
 *
 *  @param viewC      分享控制器
 *  @param shareText  分享内容
 *  @param shareImage 分享图片
 *  @param url        回调网址
 *  @param url        分享标题
 *  @param finished   回调Block
 */
- (void)qqShareToQQZoneWithViewControll:(UIViewController *)viewC shareText:(NSString *)shareText image:(UIImage *)shareImage url:(NSString *)url shareTitle:(NSString *)title finished:(void(^)(NSString *response))finished;

- (void)qqLoginWithViewController:(UIViewController *)vc suceess:(void(^)(BOOL result))result;
@end
