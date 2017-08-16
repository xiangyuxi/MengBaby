//
//  MBTabBarController.m
//  MengBaby
//
//  Created by yxiang on 2017/8/16.
//  Copyright © 2017年 yxiang. All rights reserved.
//

#import "MBTabBarController.h"

static UITabBarItem* createItem(NSString* nroImage, NSString* title) {
    UIImage * nor = [[UIImage imageNamed:nroImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage * sel = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_sel",nroImage]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem * item = [[UITabBarItem alloc] initWithTitle:title image:nor selectedImage:sel];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:COLOR_OF_HEX(0x8f8f8f)} forState:UIControlStateNormal];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:MENG_BLACK_COLOR} forState:UIControlStateSelected];
    return item;
}

@interface MBTabBarController ()

@end

@implementation MBTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray* imageNames = @[@"meng_circle_tabbar_icon",@""];
    NSArray* titleNames = @[@"萌圈",@"Item"];
    for (UIViewController* viewController in self.viewControllers) {
        NSInteger index = [self.viewControllers indexOfObject:viewController];
        viewController.tabBarItem = createItem(imageNames[index], titleNames[index]);
    }
}

@end
