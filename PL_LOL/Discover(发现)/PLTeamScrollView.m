//
//  PLTeamScrollView.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/18.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLTeamScrollView.h"
#import "TeamView.h"

@interface PLTeamScrollView ()
@property (nonatomic, weak) UIScrollView *scroll;
@end
@implementation PLTeamScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kColor(36, 41, 55);
        UIScrollView *scroll = [[UIScrollView alloc] init];
        self.scroll = scroll;
        
        scroll.showsHorizontalScrollIndicator = NO;
        [self addSubview:scroll];
        [scroll mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(10);
            make.right.equalTo(self);
            make.left.equalTo(self);
            make.bottom.equalTo(self).offset(-40);
        }];
    }
    return self;
}
- (void)customViewClick:(UITapGestureRecognizer *)recognizer {
    TeamView *view = (TeamView *)recognizer.view;
    if (![self respondsToSelector:@selector(teamIconClickWithTag:)]) {
        [self.delegate teamIconClickWithTag:view.tag];
    }
}
- (void)setTeamArr:(NSArray *)teamArr {
    _teamArr = teamArr;
    CGFloat width = 50;
    CGFloat height = 70;
    CGFloat margin = 10;
    CGFloat x = kScreenW/5;
    
    for (int i = 0; i < self.teamArr.count; ++i) {
        TeamView *customView = [[TeamView alloc] init];
        TeamModel *item = self.teamArr[i];
        customView.item = item;
        customView.tag = i;
        customView.frame = CGRectMake(i*x + margin, 0, width, height);
        [self.scroll addSubview:customView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(customViewClick:)];
        [customView addGestureRecognizer:tap];
    }
    self.scroll.contentSize = CGSizeMake(self.teamArr.count*x, 0);
}
@end
