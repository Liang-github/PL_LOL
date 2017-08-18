//
//  PLPersonController.h
//  PL_LOL
//
//  Created by PengLiang on 2017/8/18.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfoModel.h"
#import "TeamModel.h"
@interface PLPersonController : UIViewController
@property (nonatomic, strong) UserInfoModel *item;
@property (nonatomic, strong) TeamModel *model;

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UIImageView *clubBgView;
@property (nonatomic, strong) UILabel *userInfo;
@property (nonatomic, strong) UILabel *fansCount;
@end
