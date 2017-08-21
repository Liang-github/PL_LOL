//
//  PLCompetitionTableViewController.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/21.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLCompetitionTableViewController.h"

@interface PLCompetitionTableViewController ()

@end

@implementation PLCompetitionTableViewController

- (NSString *)netUrl {
    PLListItem *item = self.listAPI[1];
    return item.urlString;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



@end
