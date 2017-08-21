//
//  PLBaseViewController.h
//  PL_LOL
//
//  Created by PengLiang on 2017/8/21.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PLListItem.h"

@interface PLBaseViewController : UITableViewController
//网络地址
@property (nonatomic, copy) NSString *netUrl;
//控制器名
@property (nonatomic, strong) NSString *controllerName;
//api清单
@property (nonatomic, strong) NSArray *listAPI;
//是否加载视图
@property (nonatomic, assign, getter=isLoad) BOOL load;
@end
