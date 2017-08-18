//
//  PLClubView.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/18.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLClubView.h"
#import <UIImageView+WebCache.h>
#import "TeamModel.h"
#import "PLCustomBtn.h"
@implementation PLClubView


- (instancetype)init {
    self = [super init];
    if (self) {
        
        UIImageView *bgImageView = [[UIImageView alloc] init];
        bgImageView.frame = self.frame;
        bgImageView.image = [UIImage imageNamed:@"hero_detail_head_default"];
        [self addSubview:bgImageView];
        _icon = [[UIImageView alloc] init];
        _icon.frame = CGRectMake(10, 10, 58, 58);
        _icon.clipsToBounds = YES;
        _icon.layer.cornerRadius = _icon.width*0.5;
        [self addSubview:_icon];
        
        _name = [[UILabel alloc] init];
        _name.frame = CGRectMake(78, 10, 42, 20);
        _name.textColor = [UIColor whiteColor];
        [self addSubview:_name];
        
        UIButton *addAttention = [[UIButton alloc] init];
        addAttention.frame = CGRectMake(78, 43, 50, 25);
        [addAttention setBackgroundImage:[UIImage imageNamed:@"btn_blue_nor"] forState:UIControlStateNormal];
        [addAttention setTitle:@"+关注" forState:0];
        addAttention.titleLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:addAttention];
        
        _fansCount = [[UILabel alloc] init];
        _fansCount.frame = CGRectMake(kScreenW - 43, 10, 33, 16);
        _fansCount.textColor = [UIColor whiteColor];
        _fansCount.font = [UIFont systemFontOfSize:13];
        [self addSubview:_fansCount];
        
        UIButton *teamData = [[PLCustomBtn alloc] init];
        teamData.frame = CGRectMake(kScreenW - 66, 48.5, 56, 15);
        [teamData setTitle:@"战队资料" forState:0];
        teamData.titleLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:teamData];
        
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.frame = CGRectMake(10, 78, kScreenW - 20, 52);
        _scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_scrollView];
        
    }
    return self;
}
- (void)setItem:(TeamModel *)item {
    _item = item;
    [self.icon sd_setImageWithURL:[NSURL URLWithString:item.iconUrl] placeholderImage:[UIImage imageNamed:@"default_hero_head"]];
    self.name.text = item.name;
    double fans = [item.fansCount integerValue];
    
    self.fansCount.text = [NSString stringWithFormat:@"粉丝%.1f万",fans/10000];
    self.nameIcon.text = item.name;
}
- (void)setUrlImages:(NSArray *)urlImages {
    _urlImages = urlImages;
    CGFloat width = 49;
    CGFloat height = 49;
    CGFloat margin = 20;
    NSArray *arr = [urlImages valueForKey:@"iconUrl"];
    for (int i = 0; i < urlImages.count; ++i) {
        UIImageView *view = [[UIImageView alloc] init];
        view.layer.cornerRadius = 4;
        view.layer.masksToBounds = YES;
        view.userInteractionEnabled = YES;
        view.tag = i;
        view.frame = CGRectMake(i*(width + margin), 0, width, height);
        [view sd_setImageWithURL:[NSURL URLWithString:arr[i]] placeholderImage:[UIImage imageNamed:@"default_hero_head"]];
        [self.scrollView addSubview:view];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewClick:)];
        [view addGestureRecognizer:tap];
    }
    self.scrollView.contentSize = CGSizeMake(arr.count*(width + margin), 0);
}
- (void)imageViewClick:(UITapGestureRecognizer *)recognizer {
    UIImageView *view = (UIImageView *)recognizer.view;
    if (![self respondsToSelector:@selector(iconImageViewClickWithTag:model:)]) {
        [self.delegate iconImageViewClickWithTag:view.tag model:self.item];
    }
}
@end
