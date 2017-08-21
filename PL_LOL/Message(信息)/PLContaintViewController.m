//
//  PLContaintViewController.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/21.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLContaintViewController.h"
#import "PLMessageTableViewController.h"
#import "PLCompetitionTableViewController.h"
#import "PLFunnyTableViewController.h"
#import "PLVideoViewController.h"
#import "PLGoverTableViewController.h"
#import "PLTacticTableViewController.h"
#import "PLActivityTableViewController.h"

@interface PLContaintViewController ()<UIScrollViewDelegate>

//控制器的容器Scroll
@property (nonatomic, weak) UIScrollView *contentScroll;
//标题容器scroll
@property (nonatomic, weak) UIScrollView *titleScroll;
//选中文字
@property (nonatomic, weak) UILabel *selectLabel;
//标题文字
@property (nonatomic, strong) NSMutableArray *titleLabel;
//tag值
@property (nonatomic, assign) NSInteger btnTag;
//左上角button
@property (nonatomic, weak) UIBarButtonItem *topRightBtn;

@end

@implementation PLContaintViewController

- (NSMutableArray *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [NSMutableArray array];
        
    }
    return _titleLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpContaintScrollView];
    [self setUpChildController];
    [self setUpTitleScroll];
    
    self.contentScroll.contentSize = CGSizeMake(self.childViewControllers.count *kScreenW, 0);
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem customBarButtonItem:@"hero_rigt_arrow" addTarget:self action:@selector(rightBarButtonClick:)];
    self.topRightBtn = self.navigationItem.rightBarButtonItem;
}
- (void)rightBarButtonClick:(UIBarButtonItem *)barButton {
    barButton.tag = _btnTag + 1;
    if (barButton.tag == self.childViewControllers.count - 1) {
        barButton.enabled = NO;
    }
    UILabel *label = self.titleScroll.subviews[barButton.tag];
    [self selectTitleChangeFontColor:label];
    self.contentScroll.contentOffset = CGPointMake(barButton.tag*kScreenW, 0);
}
- (void)setUpTitleScroll {
    UIScrollView *view = [[UIScrollView alloc] init];
    view.frame = CGRectMake(0, 0, kScreenW, 44);
    view.showsHorizontalScrollIndicator = NO;
    
    self.titleScroll = view;
    CGFloat btnW = 60;
    CGFloat btnH = view.frame.size.height;
    CGFloat Margin = 25;
    for (int i = 0; i < self.childViewControllers.count; ++ i) {
        UIViewController *vc = self.childViewControllers[i];
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake((Margin + btnW)*i, 0, btnW, btnH);
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = vc.title;
        label.font = [UIFont systemFontOfSize:16];
        
        label.tag = i;
        label.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(topTitleBtnClick:)];
        [label addGestureRecognizer:tap];
        
        [self.titleLabel addObject:label];
        
        [view addSubview:label];
        
        if (label.tag == 0) {
            [self topTitleBtnClick:tap];
        }
    }
    self.titleScroll.contentSize = CGSizeMake((btnW + Margin)*self.childViewControllers.count, 0);
    self.navigationItem.titleView = view;
}
- (void)topTitleBtnClick:(UITapGestureRecognizer *)recognizer {
    UILabel *label = (UILabel *)recognizer.view;
    [self selectTitleChangeFontColor:label];
    self.contentScroll.contentOffset = CGPointMake(label.tag*kScreenW, 0);
}
- (void)setUpContaintScrollView {
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scroll.backgroundColor = [UIColor whiteColor];
    scroll.pagingEnabled = YES;
    scroll.showsHorizontalScrollIndicator = NO;
    
    scroll.delegate = self;
    scroll.contentSize = CGSizeMake(self.childViewControllers.count*kScreenW, 0);
    [self.view addSubview:scroll];
    self.contentScroll = scroll;
    self.automaticallyAdjustsScrollViewInsets = NO;
}
- (void)setUpChildController {
    //推荐
    PLMessageTableViewController *message = [[PLMessageTableViewController alloc] init];
    message.title = @"最新";
    [self addChildViewController:message];
    
    //赛事
    PLCompetitionTableViewController *comp = [[PLCompetitionTableViewController alloc] init];
    comp.title = @"赛事";
    [self addChildViewController:comp];
    
    //视频
    PLVideoViewController *video = [[PLVideoViewController alloc] init];
    video.title = @"视频";
    [self addChildViewController:video];
    //娱乐
    PLFunnyTableViewController *funny = [[PLFunnyTableViewController alloc] init];
    funny.title = @"娱乐";
    [self addChildViewController:funny];
    //官方
    PLGoverTableViewController *gover = [[PLGoverTableViewController alloc] init];
    gover.title = @"官方";
    [self addChildViewController:gover];
    //攻略
    PLTacticTableViewController *tactic = [[PLTacticTableViewController alloc] init];
    tactic.title = @"攻略";
    [self addChildViewController:tactic];
    //活动
    PLActivityTableViewController *acti = [[PLActivityTableViewController alloc] init];
    acti.title = @"活动";
    [self addChildViewController:acti];
    
    for (int i = 0; i < self.childViewControllers.count; ++ i) {
        UIViewController *vc = self.childViewControllers[i];
        vc.view.frame = CGRectMake(i*kScreenW, 0, kScreenW, kScreenH);
        [self.contentScroll addSubview:vc.view];
    }
}
- (void)selectTitleChangeFontColor:(UILabel *)label {
    _selectLabel.textColor = [UIColor whiteColor];
    label.textColor = kNaviColor;
    
    CGFloat offestX = label.center.x - kScreenW*0.5;
    if (offestX < 0) {
        offestX = 0;
    }
    CGFloat maxOffestX = self.titleScroll.contentSize.width - kScreenW + 44;
    if (offestX > maxOffestX) {
        offestX = maxOffestX;
    }
    [self.titleScroll setContentOffset:CGPointMake(offestX, 0) animated:YES];
    _selectLabel.transform = CGAffineTransformIdentity;
    label.transform = CGAffineTransformMakeScale(1.2, 1.2);
    _selectLabel = label;
    self.btnTag = _selectLabel.tag;
    if (self.btnTag == self.childViewControllers.count - 1) {
        self.topRightBtn.enabled = NO;
    } else {
        self.topRightBtn.enabled = YES;
    }
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger i = scrollView.contentOffset.x/kScreenW;
    UILabel *label = self.titleLabel[i];
    [self selectTitleChangeFontColor:label];
}
@end
