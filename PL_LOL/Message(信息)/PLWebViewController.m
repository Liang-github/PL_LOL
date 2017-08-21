//
//  PLWebViewController.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/21.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLWebViewController.h"
#import "PLMessageItem.h"
#import <WebKit/WebKit.h>
#import "PLShareView.h"
#import "CYShareTool.h"
#import <SDWebImageManager.h>
@interface PLWebViewController ()<UMSocialUIDelegate, PLShareViewDelegate>
@property (nonatomic, weak) WKWebView *webView;
@property (nonatomic, weak) UIProgressView *progress;

@property (nonatomic, assign) NSInteger tag;

@end

@implementation PLWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"咨询详情";
    WKWebView *web = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH - 64)];
    self.webView = web;
    [web addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    [self.view addSubview:self.webView];
    [self setUpWebView];
    [self addProgressView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tagChange) name:@"tagChange" object:nil];
    self.tag = 0;
}

- (void)tagChange {
    self.tag -= 1;
}
- (void)addProgressView {
    UIProgressView *progress = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    progress.progressTintColor = kColor(54, 114, 181);
    progress.frame = CGRectMake(0, 0, self.view.width, 0);
    [self.view insertSubview:progress aboveSubview:self.webView];
    self.progress = progress;
}
- (void)setUpWebView {
    if (self.item.article_url) {
        [self loadWebView:self.item.article_url];
    }
}
#pragma mark - 网络请求
- (void)loadWebView:(NSString *)urlString {
    if (![urlString hasPrefix:@"http://"]) {
        NSString *baseStr = @"http://qt.qq.com/static/pages/news/phone/";
        NSString *url = [baseStr stringByAppendingPathComponent:urlString];
        NSURL *netUrl = [NSURL URLWithString:url];
        [self.webView loadRequest:[NSURLRequest requestWithURL:netUrl]];
    }
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    [self.progress setProgress:self.webView.estimatedProgress animated:YES];
    self.progress.hidden = self.progress.progress >= 1;
    if (self.progress.progress >= 0.8) {
        self.navigationItem.rightBarButtonItem = [UIBarButtonItem customBarButtonItem:@"share_normal" selecImage:@"share_pressed" addTarget:self action:@selector(leftBarButtonClick)];
    }
}
- (void)leftBarButtonClick {
    PLShareView *view = [[PLShareView alloc] init];
    view.delegate = self;
    
    if (self.tag%2 == 0) {
        [self.view addSubview:view];
    } else if (self.tag%2 == 1) {
        [self removeShareView];
    }
    self.tag ++;
}
- (void)shareButtonClickWithView:(UIView *)view btnTag:(NSInteger)btnTag {
    NSString *shareText = nil;
    NSData *imageData = nil;
    NSString *urlString = nil;
    
    NSString *cacheKey = [[SDWebImageManager sharedManager] cacheKeyForURL:[NSURL URLWithString:self.item.image_url_small]];
    NSString *cacheImagePath = [[SDImageCache sharedImageCache] defaultCachePathForKey:cacheKey];
    if (cacheImagePath.length) {
        imageData = [NSData dataWithContentsOfFile:cacheImagePath];
    }
    UIImage *shareImage = [UIImage imageWithData:imageData];
    if ([self.item.article_url hasPrefix:@"http://"]) {
        urlString = self.item.article_url;
    } else {
        urlString = [baseUrl stringByAppendingString:self.item.article_url];
    }
    if (btnTag == 0) {
        
    } else if (btnTag == 1) {
        shareText = self.item.summary;
        [[CYShareTool shareManeger] qqShareToQQWithViewControll:self shareText:shareText image:shareImage url:urlString shareTitle:self.item.title finished:^(NSString *response) {
            MYLog(response)
        }];
    } else if (btnTag == 2) {
        [self removeShareView];
        shareText = self.item.title;
        
        [[CYShareTool shareManeger] wxShareToTimelineWithViewControll:self shareText:shareText image:shareImage url:urlString finished:^(NSString *response) {
            if ([response isEqualToString:@"成功"]) {
                
            } else if ([response isEqualToString:@"取消"]) {
                
            }
        }];
    } else if (btnTag == 3) {
        [self removeShareView];
        shareText = self.item.summary;
        [[CYShareTool shareManeger] wxShareToSessionWithViewControll:self shareText:shareText image:shareImage title:self.item.title url:urlString finished:^(NSString *response) {
            MYLog(response);
        }];
    } else if (btnTag == 4) {
        [self removeShareView];
        shareText = [NSString stringWithFormat:@"%@@英雄联盟%@%@",self.item.summary,baseUrl,self.item.article_url];
        [[CYShareTool shareManeger] wbShareWithViewControll:self shareText:shareText image:shareImage finished:^(NSString *response) {
            MYLog(response);
        }];
    } else if (btnTag == 5) {
        shareText = self.item.summary;
        [[CYShareTool shareManeger] qqShareToQQWithViewControll:self shareText:shareText image:shareImage url:urlString shareTitle:self.item.title finished:^(NSString *response) {
            MYLog(response);
        }];
    } else if (btnTag == 6) {
        
    }
}
- (void)removeShareView {
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[PLShareView class]]) {
            [view removeFromSuperview];
        }
    }
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:@"tagChange"];
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}
@end
