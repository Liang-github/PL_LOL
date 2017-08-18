//
//  PLVisitorViewController.h
//  PL_LOL
//
//  Created by PengLiang on 2017/8/17.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TencentAccountModel.h"
@interface PLVisitorViewController : UIViewController
//登录状态
@property (nonatomic, assign, readonly, getter=isLogin) BOOL login;
//账号模型
@property (nonatomic, strong) TencentAccountModel *userModel;
@end
