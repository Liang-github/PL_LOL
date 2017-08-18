//
//  PLDiscoverCell.h
//  PL_LOL
//
//  Created by PengLiang on 2017/8/18.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiscoverModel.h"
@interface PLDiscoverCell : UITableViewCell

@property (nonatomic, strong) DiscoverModel *item;

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *title;
@end
