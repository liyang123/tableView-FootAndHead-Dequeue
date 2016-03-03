//
//  LYTableViewController.m
//  TestDequeue
//
//  Created by ly on 16/3/3.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "LYTableViewController.h"
#import "LYHeaderView.h"
#import "LYFootView.h"
#import "LYTableViewCell.h"
#import "LYGroupModel.h"
#import "LYFriendsModel.h"
@interface LYTableViewController ()<HeaderViewDelegata, footViewDelegate>
@property (nonatomic, strong) NSMutableArray *dataArray;
@end


@implementation LYTableViewController

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tempArr = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
            LYGroupModel *groupModel = [LYGroupModel groupModelWithDic:dict];
            [tempArr addObject:groupModel];
        }
        self.dataArray = tempArr;
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[LYTableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    LYGroupModel *groupModel = self.dataArray[section];
    return groupModel.friends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    LYGroupModel *groupModel = self.dataArray[indexPath.section];
    LYFriendsModel *friendModel = groupModel.friends[indexPath.row];
    cell.friendModel = friendModel;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 30;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    LYFootView *footView = [LYFootView footViewWith:tableView];
    footView.footViewDelegate = self;
    footView.gropModel = self.dataArray[section];
    return footView;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    LYHeaderView *headerView = [LYHeaderView headerViewWith:tableView];
    headerView.headerViewDelegate = self;
    headerView.groupModel = self.dataArray[section];
    return headerView;
}
#pragma mark - headerViewDelegate
- (void)clieckHeaderView:(LYHeaderView *)headerView
{
    NSLog(@"%p", headerView);
}
#pragma mark - footViewDelegate
- (void)footDelegate:(LYFootView *)footView
{
    NSLog(@"%p", footView);
}




@end

