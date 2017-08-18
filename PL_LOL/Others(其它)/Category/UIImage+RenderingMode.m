//
//  UIImage+RenderingMode.m
//  ScrollView无线循环
//
//  Created by cy on 16/1/3.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "UIImage+RenderingMode.h"

@implementation UIImage (RenderingMode)

+ (UIImage *)imageWithRenderingOriginalName:(NSString *)name
{
    {
        UIImage *image = [UIImage imageNamed:name];
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        return image;
    }
}
@end
