//
//  TencentAccountModel.h
//  PL_LOL
//
//  Created by PengLiang on 2017/8/18.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TencentAccountModel : NSObject
//accessToken
@property (nonatomic, copy) NSString *accessToken;
//授权的过期时间
@property (nonatomic, retain) NSString *expirationDate;
//用户的微博头像url
@property (nonatomic, copy) NSString *iconURL;
//平台名称
@property (nonatomic, copy) NSString *platformName;
//用户昵称
@property (nonatomic, copy) NSString *userName;
//用户账号
@property (nonatomic, copy) NSString *usid;
@end
