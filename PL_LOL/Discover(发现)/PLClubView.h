//
//  PLClubView.h
//  PL_LOL
//
//  Created by PengLiang on 2017/8/18.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TeamModel;
@protocol PLClubViewDelegate <NSObject>

@optional
- (void)iconImageViewClickWithTag:(NSInteger)tag model:(TeamModel *)model;

@end
@interface PLClubView : UIView

@property (nonatomic, strong) TeamModel *item;
@property (nonatomic, strong) NSArray *urlImages;
@property (nonatomic, weak) id<PLClubViewDelegate> delegate;

//头像
@property (nonatomic, strong) UIImageView *icon;
//名字
@property (nonatomic, strong) UILabel *name;
//粉丝数量
@property (nonatomic, strong) UILabel *fansCount;
//滑动图
@property (nonatomic, strong) UIScrollView *scrollView;
//战队名字
@property (nonatomic, strong) UILabel *nameIcon;
@end
