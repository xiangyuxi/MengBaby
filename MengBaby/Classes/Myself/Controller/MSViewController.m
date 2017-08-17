//
//  MSViewController.m
//  MengBaby
//
//  Created by yxiang on 2017/8/17.
//  Copyright © 2017年 yxiang. All rights reserved.
//

#import "MSViewController.h"
#import "MyselfCommonCell.h"
#import "MyselfCell.h"

static NSString* kMyselfCommonCellIdentifier = @"MyselfCommonCell";
static NSString* kMyselfCellIdentifier = @"MyselfCell";

@interface MSViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSArray* _CellImageNames;
    NSArray* _CellTitleNames;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configSubviews];
}

- (void)configSubviews
{
    _CellImageNames = @[@[@"myself_public",@"myself_myfllow"],@[@"myself_child"],@[@"myself_about"]];
    _CellTitleNames = @[@[@"萌宝日记",@"我的关注"],@[@"萌宝信息"],@[@"关于"]];
    
    [self.navigationBar.rightButton setImage:[UIImage imageNamed:@"meng_setting"] forState:UIControlStateNormal];
    
    self.tableView.contentInset = UIEdgeInsetsMake(self.navigationBar.height, 0, 0, 0);
    
    [self.tableView registerNib:[MyselfCommonCell loadNib] forCellReuseIdentifier:kMyselfCommonCellIdentifier];
    [self.tableView registerNib:[MyselfCell loadNib] forCellReuseIdentifier:kMyselfCellIdentifier];
    
    [self.navigationBar.rightButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    segue.destinationViewController.hidesBottomBarWhenPushed = YES;
}

#pragma mark - Actions

- (void)rightButtonAction:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"setting" sender:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1) {
        return 2;
    }else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        MyselfCell* cell = [tableView dequeueReusableCellWithIdentifier:kMyselfCellIdentifier];
        return cell;
    }else {
        MyselfCommonCell* cell = [tableView dequeueReusableCellWithIdentifier:kMyselfCommonCellIdentifier];
        cell.iconImageView.image = [UIImage imageNamed:_CellImageNames[indexPath.section-1][indexPath.row]];
        cell.titleLabel.text = _CellTitleNames[indexPath.section-1][indexPath.row];
        return cell;
    }
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 84;
    }else {
        return 44;
    }
}

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
