//
//  SettingGroupItem.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/18.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "SettingGroupItem.h"

@implementation SettingGroupItem

+ (instancetype)groupItem:(NSArray *)items {
    SettingGroupItem *group = [[self alloc] init];
    group.items = items;
    return group;
}
@end
