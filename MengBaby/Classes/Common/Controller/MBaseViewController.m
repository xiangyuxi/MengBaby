//
//  MBaseViewController.m
//  MengBaby
//
//  Created by yxiang on 2017/8/16.
//  Copyright © 2017年 yxiang. All rights reserved.
//

#import "MBaseViewController.h"

@interface MBaseViewController ()

@end

@implementation MBaseViewController

@synthesize navigationBar = _navigationBar;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _navigationBar = [MBNavigationBar loadInstanceFromNib];
    _navigationBar.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    [self.view addSubview:_navigationBar];
    [self.view bringSubviewToFront:_navigationBar];
}

- (void)setTitle:(NSString *)title
{
    if (title && title.length > 0) {
        _navigationBar.titleLabel.text = title;
    }
}

@end
