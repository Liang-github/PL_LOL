//
//  SettingGroupItem.h
//  PL_LOL
//
//  Created by PengLiang on 2017/8/18.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingGroupItem : NSObject
//行模型数组
@property (nonatomic, strong) NSArray *items;

+ (instancetype)groupItem:(NSArray *)items;
@end
