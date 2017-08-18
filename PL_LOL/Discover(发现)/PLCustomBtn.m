//
//  PLCustomBtn.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/18.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLCustomBtn.h"

@implementation PLCustomBtn

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(self.titleLabel.width + 3, 0, self.imageView.width, self.imageView.height);
    self.titleLabel.frame = CGRectMake(-3, 0, self.titleLabel.width, self.titleLabel.height);
}

@end
