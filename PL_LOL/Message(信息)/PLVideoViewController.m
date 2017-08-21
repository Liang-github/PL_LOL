//
//  PLVideoViewController.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/21.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLVideoViewController.h"

@interface PLVideoViewController ()
@property (nonatomic, weak) UIWebView *webView;

@end

@implementation PLVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *web = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.webView = web;
    [self.view addSubview:self.webView];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:videoControllerUrl]]];
}



@end
