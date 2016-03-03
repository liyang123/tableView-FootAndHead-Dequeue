//
//  LYHeaderView.h
//  TestDequeue
//
//  Created by ly on 16/3/3.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LYGroupModel;
@class LYHeaderView;

@protocol HeaderViewDelegata <NSObject>
@optional
- (void)clieckHeaderView:(LYHeaderView *)headerView;
@end

@interface LYHeaderView : UITableViewHeaderFooterView
/** 分组模型 */
@property (nonatomic, strong) LYGroupModel *groupModel;

@property (nonatomic, assign) id<HeaderViewDelegata>headerViewDelegate;

+ (instancetype)headerViewWith:(UITableView *)tableView;
@end
