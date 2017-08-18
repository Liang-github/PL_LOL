//
//  UserInfoModel.h
//  PL_LOL
//
//  Created by PengLiang on 2017/8/18.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoModel : NSObject
//头像地址
@property (nonatomic, copy) NSString *iconUrl;
//详细介绍
@property (nonatomic, copy) NSString *intro;
//名字
@property (nonatomic, copy) NSString *name;
//编号
@property (nonatomic, copy) NSString *id;
@end
