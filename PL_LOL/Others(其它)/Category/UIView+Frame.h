//
//  UIView+Frame.h
//  小码哥彩票
//
//  Created by xmg on 15/12/15.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property (nonatomic ,assign) CGFloat width;

@property (nonatomic ,assign) CGFloat height;

@property (nonatomic ,assign) CGFloat y;

@property (nonatomic ,assign) CGFloat x;

@property (nonatomic, assign) CGFloat centerX;

/**
 *  重Xib中加载视图
 *
 *  @return XIB视图
 */
+ (instancetype)viewFraomXib;
@end
