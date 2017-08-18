//
//  SettingItem.h
//  
//
//  Created by PengLiang on 2017/8/18.
//
//

#import <Foundation/Foundation.h>

@interface SettingItem : NSObject
//标题
@property (nonatomic, copy) NSString *title;
//子标题
@property (nonatomic, copy) NSString *subTitle;

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle;
@end
