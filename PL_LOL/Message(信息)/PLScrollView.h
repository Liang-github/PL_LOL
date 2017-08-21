//
//  PLScrollView.h
//  PL_LOL
//
//  Created by PengLiang on 2017/8/21.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PLScrollView;

@protocol PLScrollViewDelegate <NSObject>

- (void)plScrollView:(PLScrollView *)scrollView didClickItemAtIndex:(NSInteger)index;

@end
@interface PLScrollView : UIView

@property (nonatomic, strong) NSArray *urlStrings;

@property (nonatomic, strong) NSArray *texts;

@property (nonatomic, weak) id<PLScrollViewDelegate> delegate;
@end
