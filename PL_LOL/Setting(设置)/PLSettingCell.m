//
//  PLSettingCell.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/21.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLSettingCell.h"
#import "SettingItem.h"
#import "SettingArrowItem.h"
#import "SettingSwichItem.h"
@implementation PLSettingCell

+ (instancetype)cellWithIdentifier:(UITableView *)tableView {
    PLSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[PLSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    return cell;
}
- (void)setItem:(SettingItem *)item {
    _item = item;
    self.textLabel.text = item.title;
    self.detailTextLabel.text = item.subTitle;
    [self setUpAccessView];
}
- (void)setUpAccessView {
    if ([_item isKindOfClass:[SettingArrowItem class]]) {
        UIImageView *arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hero_rigt_arrow"]];
        self.accessoryView = arrowImageView;
        self.detailTextLabel.font = [UIFont systemFontOfSize:14];
    } else if ([_item isKindOfClass:[SettingSwichItem class]]) {
        SettingSwichItem *swItem = (SettingSwichItem *)_item;
        UISwitch *sw = [[UISwitch alloc] init];
        sw.on = swItem.isOpen;
        self.accessoryView = sw;
        self.detailTextLabel.textColor = [UIColor blackColor];
    } else {
        self.accessoryView = nil;
    }
}
@end
