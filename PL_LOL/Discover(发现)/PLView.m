//
//  PLView.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/18.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLView.h"
#import <UIImageView+WebCache.h>
@implementation PLView

- (instancetype)init {
    self = [super init];
    if (self) {
        _icon = [[UIImageView alloc] init];
        _icon.frame = CGRectMake((self.width - 35)/2, 10, 35, 35);
        [self addSubview:_icon];
        
        _title = [[UILabel alloc] init];
        _title.frame = CGRectMake(0, 60, self.width, 20);
        _title.font = [UIFont systemFontOfSize:10];
        _title.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_title];
    }
    return self;
}
- (void)setItem:(DiscoverModel *)item {
    _item = item;
    [self.icon sd_setImageWithURL:[NSURL URLWithString:item.image_url_big]];
    self.title.text = item.title;
}
@end
