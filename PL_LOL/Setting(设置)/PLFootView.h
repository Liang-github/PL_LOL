//
//  PLFootView.h
//  PL_LOL
//
//  Created by PengLiang on 2017/8/21.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PLFootViewDelegate <NSObject>

@optional
- (void)footViewButtonClickWithView:(UIView *)view button:(UIButton *)button;

@end
@interface PLFootView : UIView

@property (nonatomic, assign) id<PLFootViewDelegate> delegate;
@property (nonatomic, weak) NSLayoutConstraint *btnTop;
@property (nonatomic, copy) NSString *button;
@property (nonatomic, strong) UIButton *btn;

@end
