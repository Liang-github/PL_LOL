//
//  PLFootView.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/21.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLFootView.h"

@implementation PLFootView

- (instancetype)init {
    self = [super init];
    if (self) {
        _btn = [[UIButton alloc] init];
        _btn.frame = CGRectMake(20, 0, self.frame.size.width - 40, self.frame.size.height);
        [_btn setBackgroundImage:[UIImage imageNamed:@"btn_pink_nor"] forState:UIControlStateNormal];
        _btn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_btn setTitle:@"退出登录" forState:0];
        [self addSubview:_btn];
    }
    return self;
}

@end
