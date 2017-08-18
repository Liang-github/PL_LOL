//
//  CYShareTool.m
//  LOL
//
//  Created by cy on 16/4/10.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "CYShareTool.h"


@implementation CYShareTool

static CYShareTool *shareManeger;
+ (instancetype)shareManeger
{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        shareManeger = [[super alloc] init];
        
    });
    return shareManeger;
}
- (instancetype)init
{
    if (self = [super init]) {
        [UMSocialConfig setFinishToastIsHidden:YES position:UMSocialiToastPositionCenter];
    }
    return self;
}

/**
 *  微信朋友圈分享
 */
- (void)wxShareToTimelineWithViewControll:(UIViewController *)viewC shareText:(NSString *)shareText image:(UIImage *)shareImage url:(NSString *)url finished:(void(^)(NSString *response))finished
{
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = url;
    [self shareCommonMethod:viewC
                       type:UMShareToWechatTimeline
                  shareText:shareText
                      image:shareImage
                   finished:^(NSString *response) {
                       if (finished) {
                           finished(response);
                       }
                   }];

}

/**
 *  微信好友分享
 */
- (void)wxShareToSessionWithViewControll:(UIViewController *)viewC shareText:(NSString *)shareText image:(UIImage *)shareImage title:(NSString *)title url:(NSString *)url finished:(void(^)(NSString *response))finished
{
    [UMSocialData defaultData].extConfig.wechatSessionData.url = url;
    [UMSocialData defaultData].extConfig.wechatSessionData.title = title;
    [self shareCommonMethod:viewC
                       type:UMShareToWechatSession
                  shareText:shareText
                      image:shareImage
                   finished:^(NSString *response) {
                       if (finished) {
                           finished(response);
                       }
                   }];
}


/**
 *  新浪微博分享
 */
- (void)wbShareWithViewControll:(UIViewController *)viewC shareText:(NSString *)shareText image:(UIImage *)shareImage finished:(void(^)(NSString *response))finished
{
    [self shareCommonMethod:viewC
                       type:UMShareToSina
                  shareText:shareText
                      image:shareImage
                   finished:^(NSString *response) {
                       if (finished) {
                           finished(response);
                       }
                   }];
}
/**
 *  QQ分享
 */
- (void)qqShareToQQWithViewControll:(UIViewController *)viewC shareText:(NSString *)shareText image:(UIImage *)shareImage url:(NSString *)url shareTitle:(NSString *)title finished:(void(^)(NSString *response))finished
{
    [UMSocialData defaultData].extConfig.qqData.url = url;
    [UMSocialData defaultData].extConfig.qqData.title = title;
    [self shareCommonMethod:viewC
                       type:UMShareToQQ
                  shareText:shareText
                      image:shareImage
                   finished:^(NSString *response) {
                       if (finished) {
                           finished(response);
                       }
                   }];
}

/**
 *  QQ空间分享
 */
- (void)qqShareToQQZoneWithViewControll:(UIViewController *)viewC shareText:(NSString *)shareText image:(UIImage *)shareImage url:(NSString *)url shareTitle:(NSString *)title finished:(void(^)(NSString *response))finished;
{
    [UMSocialData defaultData].extConfig.qzoneData.url = url;
    [UMSocialData defaultData].extConfig.qzoneData.title = title;
    [self shareCommonMethod:viewC
                       type:UMShareToQzone
                  shareText:shareText
                      image:shareImage
                   finished:^(NSString *response) {
                       if (finished) {
                           finished(response);
                       }
                       }];
}
/**
 *  分享公用方法
 */
- (void)shareCommonMethod:(UIViewController *)viewC type:(NSString *)string shareText:(NSString *)shareText image:(UIImage *)shareImage finished:(void(^)(NSString *response))finished
{
    [[UMSocialDataService defaultDataService] postSNSWithTypes:@[string]
                                                       content:shareText
                                                         image:shareImage
                                                      location:nil
                                                   urlResource:nil
                                           presentedController:viewC
                                                    completion:^(UMSocialResponseEntity *response) {
                                                        if (finished) {
                                                            if (response.responseCode == UMSResponseCodeSuccess) {
                                                                finished(@"成功");
                                                            }else if(response.responseCode == UMSResponseCodeCancel)
                                                                finished(@"取消");
                                                        }
                                                        
                                                    }];
}


- (void)qqLoginWithViewController:(UIViewController *)vc suceess:(void(^)(BOOL result))result
{
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
    
    snsPlatform.loginClickHandler(vc,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        if (response.responseCode == UMSResponseCodeSuccess) {
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToQQ];
            NSArray *acounMessage = @[@{
                                        @"uid":snsAccount.usid,
                                        @"userName":snsAccount.userName,
                                        @"accessToken":snsAccount.accessToken,
                                        @"expirationDate":snsAccount.expirationDate,
                                        @"iconURL":snsAccount.iconURL,
                                        @"platformName":snsAccount.platformName
            }];
            [[NSUserDefaults standardUserDefaults] setObject:acounMessage forKey:@"acounMessage"];
            
            if (result) {
                result(YES);
            }
        }});
}
@end
