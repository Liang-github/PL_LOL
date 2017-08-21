//
//  PLCustomView.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/21.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLCustomView.h"

@implementation PLCustomView

- (instancetype)init {
    self = [super init];
    if (self) {
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = CGRectMake(0, 0, kScreenW, 181);
        _imageView.userInteractionEnabled = YES;
        [self addSubview:_imageView];
        
        _label = [[UILabel alloc] init];
        _label.frame = CGRectMake(0, 160, 50, 20);
        _label.font = [UIFont systemFontOfSize:12];
        [self addSubview:_label];
    }
    return self;
}

@end
