//
//  PLSectionCell.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/18.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLSectionCell.h"
#import "PLView.h"

@implementation PLSectionCell

- (void)iconClick:(UITapGestureRecognizer *)tap {
    PLView *view = (PLView *)tap.view;
    if (![self respondsToSelector:@selector(cellIconViewClickWithTag:)]) {
        [self.delegate cellIconViewClickWithTag:view.tag];
    }
}
- (void)setItemArr:(NSArray *)itemArr {
    _itemArr = itemArr;
    
    if (self.contentView.subviews.count) {
        return;
    }
    for (int i = 0; i <itemArr.count; ++i) {
        PLView *view = [[PLView alloc] init];
        view.item = itemArr[i];
        view.tag = i;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(iconClick:)];
        [view addGestureRecognizer:tap];
        [self.contentView addSubview:view];
    }
}
- (void)layoutSubviews {
    [super layoutSubviews];
    for (PLView *view in self.contentView.subviews) {
        view.width = 80;
        view.height = self.contentView.height;
        NSInteger i = view.tag;
        if (i == 0) {
            view.x = 10;
        } else if (i == 1) {
            view.centerX = self.centerX;
        } else {
            view.x = self.contentView.width - view.width - 10;
        }
    }
}
@end
