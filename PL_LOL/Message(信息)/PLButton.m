//
//  PLButton.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/21.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLButton.h"

@implementation PLButton

+ (instancetype)buttonWithType:(UIButtonType)buttonType {
    PLButton *btn = [super buttonWithType:buttonType];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:11];
    return btn;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.x = 0;
    self.imageView.y = 0;
    self.titleLabel.width = self.width;
    self.titleLabel.y = self.imageView.height + 3;
    self.titleLabel.height = self.height - self.titleLabel.y;
    self.titleLabel.x = 0;
}
@end
