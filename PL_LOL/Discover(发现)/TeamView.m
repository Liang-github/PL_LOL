//
//  TeamView.m
//  
//
//  Created by PengLiang on 2017/8/18.
//
//

#import "TeamView.h"
#import <UIImageView+WebCache.h>
#import "TeamModel.h"

@interface TeamView ()

//头像
@property (nonatomic, weak) UIImageView *icon;
//名字
@property (nonatomic, weak) UILabel *name;
//推荐
@property (nonatomic, weak) UILabel *label;

@end
@implementation TeamView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *image = [[UIImageView alloc] init];
        self.icon = image;
        [self addSubview:image];
        
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        self.name = label;
        
        UILabel *label1 = [[UILabel alloc] init];
        label1.text = @"推荐";
        label1.textColor = [UIColor whiteColor];
        label1.font = [UIFont systemFontOfSize:11];
        label1.backgroundColor = [UIColor redColor];
        [self addSubview:label1];
        self.label = label1;
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.icon.width = self.width;
    self.icon.height = self.width;
    
    self.name.y = self.icon.height + 10;
    self.name.width = self.width;
    self.name.height = self.height - self.icon.height;
    
    self.icon.layer.cornerRadius = self.width*0.5;
    self.icon.clipsToBounds = YES;
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.icon.mas_right).offset(0);
        make.bottom.equalTo(self.icon.mas_bottom).offset(0);
    }];
}
- (void)setItem:(TeamModel *)item {
    _item = item;
    [self.icon sd_setImageWithURL:[NSURL URLWithString:item.iconUrl] placeholderImage:[UIImage imageNamed:@"default_hero_head"]];
    self.name.text = item.name;
}
@end
