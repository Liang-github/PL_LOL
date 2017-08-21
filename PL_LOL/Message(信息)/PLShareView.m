//
//  PLShareView.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/21.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLShareView.h"

@implementation PLShareView

- (instancetype)init {
    self = [super init];
    if (self) {
        _sharebottomView = [[UIView alloc] init];
        _sharebottomView.frame = CGRectMake(0, 303, 375, 300);
        [self addSubview:_sharebottomView];
        
        _label = [[UILabel alloc] init];
        _label.frame = CGRectMake(153, 20, 68, 21);
        _label.text = @"分享给谁";
        [_sharebottomView addSubview:_label];
        
        _cancelBtn = [[UIButton alloc] init];
        _cancelBtn.frame = CGRectMake(20, 240, 335, 40);
        _cancelBtn.backgroundColor = [UIColor lightGrayColor];
        [_cancelBtn setTitle:@"取消" forState:0];
        [_sharebottomView addSubview:_cancelBtn];
        
        _shareTopView = [[UIView alloc] init];
        _shareTopView.frame = CGRectMake(0, 0, 375, 303);
        _shareTopView.backgroundColor = kColor(208, 159, 101);
        [self addSubview:_shareTopView];
    }
    return self;
}

@end
