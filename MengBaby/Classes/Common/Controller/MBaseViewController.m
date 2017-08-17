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
    
    [self configNavigationBackItem];
}

- (void)configNavigationBackItem
{
    if (self.navigationController) {
        self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
        
        NSInteger index = [self.navigationController.viewControllers indexOfObject:self];
        _navigationBar.backButton.hidden = index<=0;
        if (index > 0) {
            [_navigationBar.backButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
            _navigationBar.titleLabelCenterConstraint.priority = UILayoutPriorityRequired;
            _navigationBar.titleLabelLeftConstraint.priority = UILayoutPriorityDefaultLow;
            _navigationBar.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        }
    }
}

#pragma mark - Actions

- (void)backAction:(id)sender
{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)setTitle:(NSString *)title
{
    if (title && title.length > 0) {
        _navigationBar.titleLabel.text = title;
    }
}

@end
