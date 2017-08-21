//
//  HeadView.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/21.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "HeadView.h"
#import <UIImageView+WebCache.h>
@interface HeadView ()
@property (nonatomic, weak) UIImageView *bgImage;
@property (nonatomic, weak) UIImageView *iconImage;
@property (nonatomic, weak) UILabel *name;
@property (nonatomic, weak) UILabel *smallLabel;
@end
@implementation HeadView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *image = [[UIImageView alloc] init];
        image.image = [UIImage imageNamed:@"hero_detail_head_default"];
        self.bgImage = image;
        [self addSubview:image];
        
        UIImageView *iconImage = [[UIImageView alloc] init];
        self.iconImage = iconImage;
        [self addSubview:iconImage];
        
        UILabel *smallLabel = [[UILabel alloc] init];
        smallLabel.text = @"1张";
        smallLabel.backgroundColor = [UIColor blackColor];
        smallLabel.textAlignment = NSTextAlignmentCenter;
        smallLabel.textColor = [UIColor whiteColor];
        smallLabel.font = [UIFont systemFontOfSize:9];
        [iconImage addSubview:smallLabel];
        self.smallLabel = smallLabel;
        
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor whiteColor];
        self.name = label;
        [self addSubview:label];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.bgImage.frame = self.bounds;
    
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(15);
        make.left.equalTo(self).offset(10);
        make.bottom.equalTo(self).offset(-15);
        make.width.equalTo(@75);
    }];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self.iconImage.mas_right).offset(10);
    }];
    [self.smallLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.iconImage);
        make.bottom.equalTo(self.iconImage);
        make.width.equalTo(@25);
        make.height.equalTo(@15);
    }];
}
- (void)setUserModel:(TencentAccountModel *)userModel {
    _userModel = userModel;
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:userModel.iconURL] placeholderImage:[UIImage imageNamed:@"default_hero_head"]];
    self.name.text = userModel.userName;
}
@end
