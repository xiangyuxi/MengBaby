//
//  MSettingViewController.m
//  MengBaby
//
//  Created by yxiang on 2017/8/17.
//  Copyright © 2017年 yxiang. All rights reserved.
//

#import "MSettingViewController.h"
#import "MyselfCommonCell.h"

static NSString* kMyselfCommonCellIdentifier = @"MyselfCommonCell";

@interface MSettingViewController ()
{
    NSArray* _CellImageNames;
    NSArray* _CellTitleNames;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MSettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configSubviews];
}

- (void)configSubviews
{
    self.title = @"设置";
    
    self.navigationBar.rightButton.hidden = YES;
    
    _CellImageNames = @[@[@"account_safety",@"myself_cache"],@[@"get_back"],@[@"myself_login_out"]];
    _CellTitleNames = @[@[@"账号安全",@"缓存"],@[@"意见与反馈"],@[@"退出登录"]];
    
    self.tableView.contentInset = UIEdgeInsetsMake(self.navigationBar.height, 0, 0, 0);
    [self.tableView registerNib:[MyselfCommonCell loadNib] forCellReuseIdentifier:kMyselfCommonCellIdentifier];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyselfCommonCell* cell = [tableView dequeueReusableCellWithIdentifier:kMyselfCommonCellIdentifier];
    cell.iconImageView.image = [UIImage imageNamed:_CellImageNames[indexPath.section][indexPath.row]];
    cell.titleLabel.text = _CellTitleNames[indexPath.section][indexPath.row];
    if (indexPath.section == 1) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
