//
//  PLActivityTableViewController.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/21.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLActivityTableViewController.h"

@interface PLActivityTableViewController ()

@end

@implementation PLActivityTableViewController

- (NSString *)netUrl {
    PLListItem *item = self.listAPI[6];
    return item.urlString;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



@end
