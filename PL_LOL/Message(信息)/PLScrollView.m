//
//  PLScrollView.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/21.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLScrollView.h"
#import "PLCustomView.h"
#import <UIImageView+WebCache.h>


@interface PLScrollView ()<UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *scroll;
@property (nonatomic, weak) UIPageControl *pageControl;
//定时器
@property (nonatomic, weak) NSTimer *timer;
@end
@implementation PLScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIScrollView *scroll = [[UIScrollView alloc] init];
        scroll.showsHorizontalScrollIndicator = NO;
        scroll.showsVerticalScrollIndicator = NO;
        scroll.pagingEnabled = YES;
        scroll.bounces = NO;
        scroll.delegate = self;
        [self addSubview:scroll];
        self.scroll = scroll;
        
        UIPageControl *pageControl = [[UIPageControl alloc] init];
        [self addSubview:pageControl];
        
        for (int i = 0; i < 3; i ++) {
            PLCustomView *view = [[PLCustomView alloc] init];
            view.userInteractionEnabled = YES;
            
            [view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick:)]];
            [scroll addSubview:view];
        }
        [self startTimer];
    }
    return self;
}
- (void)viewClick:(UITapGestureRecognizer *)tap {
    if ([self.delegate respondsToSelector:@selector(plScrollView:didClickItemAtIndex:)]) {
        [self.delegate plScrollView:self didClickItemAtIndex:tap.view.tag];
    }
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.scroll.frame = self.bounds;
    self.scroll.contentSize = CGSizeMake(3*self.bounds.size.width, 0);
    for (int i = 0; i < 3; ++ i) {
        UIView *view = self.scroll.subviews[i];
        view.frame = CGRectMake(i*self.scroll.frame.size.width, 0, self.scroll.frame.size.width, self.scroll.frame.size.height);
    }
    CGFloat pageX = self.frame.size.width;
    CGFloat pageY = self.frame.size.height;
    
    self.pageControl.frame = CGRectMake(0, 0, pageX*0.25, 20);
    self.pageControl.layer.anchorPoint = CGPointMake(1, 1);
    self.pageControl.layer.position = CGPointMake(pageX, pageY);
    [self updateContent];
}
- (void)updateContent {
    NSInteger page = self.pageControl.currentPage;
    for (int i = 0; i < 3; ++ i) {
        PLCustomView *view = self.scroll.subviews[i];
        NSInteger index = 0;
        if (i == 0) {
            index = page - 1;
        } else if (i == 1) {
            index = page;
        } else if (i == 2) {
            index = page + 1;
        }
        
        if (index == -1) {
            index = self.urlStrings.count - 1;
        } else if (index == self.urlStrings.count) {
            index = 0;
        }
        [view.imageView sd_setImageWithURL:[NSURL URLWithString:self.urlStrings[index]] placeholderImage:[UIImage imageNamed:@"hero_time_default_logo"]];
        view.label.text = self.texts[index];
        view.tag = index;
    }
    self.scroll.contentOffset = CGPointMake(self.scroll.frame.size.width, 0);
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    PLCustomView *destImageView = nil;
    CGFloat minDelta = MAXFLOAT;
    for (NSInteger i = 0; i < 3; i ++) {
        PLCustomView *imageView = self.scroll.subviews[i];
        
        CGFloat delta = 0;
        
        delta = ABS(self.scroll.contentOffset.x - imageView.frame.origin.x);
        
        if (delta < minDelta) {
            minDelta = delta;
            destImageView = imageView;
        }
    }
    self.pageControl.currentPage = destImageView.tag;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self updateContent];
    [self startTimer];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self stopTimer];
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self updateContent];
}
- (void)setUrlStrings:(NSArray *)urlStrings {
    _urlStrings = urlStrings;
    self.pageControl.numberOfPages = urlStrings.count;
}
#pragma mark - 定时器
- (void)startTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
- (void)stopTimer {
    [self.timer invalidate];
    self.timer = nil;
}
- (void)nextPage {
    [self.scroll setContentOffset:CGPointMake(self.scroll.contentOffset.x + self.scroll.frame.size.width, 0) animated:YES];
}
@end
