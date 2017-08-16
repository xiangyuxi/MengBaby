//
//  MBTabBarController.m
//  MengBaby
//
//  Created by yxiang on 2017/8/16.
//  Copyright © 2017年 yxiang. All rights reserved.
//

#import "MBTabBarController.h"

@interface MBTabBarController ()

@end

@implementation MBTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tabBar.tintColor = MENG_BLACK_COLOR;
    for (UIViewController* viewController in self.viewControllers) {
        viewController.tabBarItem.image = [viewController.tabBarItem.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
}

@end
