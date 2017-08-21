//
//  PLShareView.h
//  PL_LOL
//
//  Created by PengLiang on 2017/8/21.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PLShareViewDelegate <NSObject>

@optional
- (void)shareButtonClickWithView:(UIView *)view btnTag:(NSInteger)btnTag;

@end
@interface PLShareView : UIView

@property (nonatomic, weak) id<PLShareViewDelegate> delegate;

@property (nonatomic, strong) UIView *sharebottomView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, strong) UIView *shareTopView;
@end
