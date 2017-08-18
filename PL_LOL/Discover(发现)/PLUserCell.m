//
//  PLUserCell.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/18.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLUserCell.h"
#import <UIImageView+WebCache.h>
#import "UserInfoModel.h"
@interface PLUserCell ()

@property (nonatomic, strong) UILabel *goodLabel;
@end
@implementation PLUserCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _icon = [[UIImageView alloc] init];
        _icon.frame = CGRectMake(10, 10, 40, 40);
        _icon.clipsToBounds = YES;
        _icon.layer.cornerRadius = 5;
        [self.contentView addSubview:_icon];
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.frame = CGRectMake(60, 20, 100, 20);
        [self.contentView addSubview:_nameLabel];
        
        _userInfoLabel = [[UILabel alloc] init];
        _userInfoLabel.textColor = [UIColor lightGrayColor];
        _userInfoLabel.font = [UIFont systemFontOfSize:14];
        _userInfoLabel.frame = CGRectMake(60, 40, kScreenW - 80, 40);
        _userInfoLabel.numberOfLines = 0;
        [self.contentView addSubview:_userInfoLabel];
    }
    return self;
}
- (void)setItem:(UserInfoModel *)item {
    _item = item;
    [self.icon sd_setImageWithURL:[NSURL URLWithString:item.iconUrl] placeholderImage:[UIImage imageNamed:@"default_hero_head"]];
    self.nameLabel.text = item.name;
    self.userInfoLabel.text = item.intro;
}
@end
