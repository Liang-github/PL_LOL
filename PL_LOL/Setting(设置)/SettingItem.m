//
//  SettingItem.m
//  
//
//  Created by PengLiang on 2017/8/18.
//
//

#import "SettingItem.h"

@implementation SettingItem

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle {
    SettingItem *item = [[self alloc] init];
    item.title = title;
    item.subTitle = subTitle;
    return item;
}
@end
