//
//  LYFootView.h
//  TestDequeue
//
//  Created by ly on 16/3/3.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LYGroupModel;
@class LYFootView;
@protocol footViewDelegate <NSObject>
@optional
- (void)footDelegate:(LYFootView *)footView;
@end

@interface LYFootView : UITableViewHeaderFooterView
@property (nonatomic, assign) id<footViewDelegate>footViewDelegate;
/** 好友模型 */
@property (nonatomic, strong) LYGroupModel *gropModel;
+ (instancetype)footViewWith:(UITableView *)tableView;
@end
