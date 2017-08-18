//
//  UIBarButtonItem+Extension.h
//  LOL
//
//  Created by cy on 16/3/11.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
/**
 *  自定义Barbutton2张图片
 *
 *  @param imageName  图片名字
 *  @param selectName 高亮图名字
 *  @param Target     taget
 *  @param action     action
 *
 *  @return barbutton
 */
+ (instancetype)customBarButtonItem:(NSString *)imageName selecImage:(NSString *)selectName addTarget:(id)Target action:(SEL)action;
/**
 *  自定义Barbutton1张图片
 *
 *  @param imageName  图片名字
 *  @param Target     taget
 *  @param action     action
 *
 *  @return barbutton
 */
+ (instancetype)customBarButtonItem:(NSString *)imageName addTarget:(id)Target action:(SEL)action;
@end
