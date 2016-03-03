//
//  LYTableViewCell.h
//  TestDequeue
//
//  Created by ly on 16/3/3.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LYFriendsModel;
@interface LYTableViewCell : UITableViewCell
/** 好友模型数据 */
@property (nonatomic, strong) LYFriendsModel *friendModel;

@end
