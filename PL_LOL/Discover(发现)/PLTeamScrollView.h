//
//  PLTeamScrollView.h
//  PL_LOL
//
//  Created by PengLiang on 2017/8/18.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PLTeamScrollViewDelegate <NSObject>

@optional

- (void)teamIconClickWithTag:(NSInteger)tag;

@end
@interface PLTeamScrollView : UIView

@property (nonatomic, strong) NSArray *teamArr;

@property (nonatomic, weak) id<PLTeamScrollViewDelegate> delegate;
@end
