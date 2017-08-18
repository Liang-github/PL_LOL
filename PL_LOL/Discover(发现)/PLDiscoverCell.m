//
//  PLDiscoverCell.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/18.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLDiscoverCell.h"
#import <UIImageView+WebCache.h>
@implementation PLDiscoverCell

- (instancetype)init {
    self = [super init];
    if (self) {
        _icon = [[UIImageView alloc] init];
        _icon.frame = CGRectMake(20, 10, 25, 25);
        [self.contentView addSubview:_icon];
        
        _title = [[UILabel alloc] init];
        _title.frame = CGRectMake(65, 13, 8, 18);
        [self.contentView addSubview:_title];
    }
    return self;
}
- (void)setItem:(DiscoverModel *)item {
    _item = item;
    self.title.text = item.title;
    [self.icon sd_setImageWithURL:[NSURL URLWithString:item.image_url_big]];
}
@end
