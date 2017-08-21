//
//  PLMessageCell.h
//  PL_LOL
//
//  Created by PengLiang on 2017/8/21.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PLMessageItem.h"

@interface PLMessageCell : UITableViewCell

@property (nonatomic, strong) PLMessageItem *item;

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UIImageView *playImage;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@end
