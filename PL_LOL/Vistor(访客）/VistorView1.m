//
//  VistorView1.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/21.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "VistorView1.h"

@implementation VistorView1

- (instancetype)init {
    self = [super init];
    if (self) {
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = CGRectMake((kScreenW - 224)/2, 41, 224, 245);
        _imageView.image = [UIImage imageNamed:@"tourists_location"];
        [self addSubview:_imageView];
        
        _label = [[UILabel alloc] init];
        _label.frame = CGRectMake((kScreenW - 300)/2, 286, 300, 36);
        _label.text = @"登录后,可以看到英雄资料以及你所拥有的英雄,还可以参与趣味问答哦!";
        _label.font = [UIFont systemFontOfSize:15];
        _label.numberOfLines = 0;
        [self addSubview:_label];
        
        _button = [[UIButton alloc] init];
        _button.frame = CGRectMake((kScreenW - 300)/2, 330, 300, 40);
        [_button setBackgroundImage:[UIImage imageNamed:@"btn_blue_nor"] forState:UIControlStateNormal];
        [_button setTitle:@"登录" forState:0];
        _button.titleLabel.font = [UIFont systemFontOfSize:18];
        [self addSubview:_button];
    }
    return self;
}

@end
