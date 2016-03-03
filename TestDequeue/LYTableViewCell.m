//
//  LYTableViewCell.m
//  TestDequeue
//
//  Created by ly on 16/3/3.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "LYTableViewCell.h"
#import "LYFriendsModel.h"
@interface LYTableViewCell ()
/** 好友头像 */
@property (nonatomic, strong) UIImageView *iconView;
/** 好友名字 */
@property (nonatomic, strong) UILabel *titleLabel;
/** 好友简介 */
@property (nonatomic, strong) UILabel *subtitleLabel;
@end

@implementation LYTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}
- (UIImageView *)iconView {
    if (!_iconView) {
        self.iconView = [[UIImageView alloc] init];
        _iconView.layer.cornerRadius = 20;
        _iconView.layer.masksToBounds = YES;
        [self addSubview:_iconView];
    }
    return _iconView;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}
- (UILabel *)subtitleLabel {
    if (!_subtitleLabel) {
        self.subtitleLabel = [[UILabel alloc] init];
        self.subtitleLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_subtitleLabel];
    }
    return _subtitleLabel;
}
- (void)setFriendModel:(LYFriendsModel *)friendModel {
    if (_friendModel != friendModel) {
        _friendModel = friendModel;
    }
    self.iconView.image = [UIImage imageNamed:friendModel.icon];
    self.titleLabel.text = friendModel.name;
    self.subtitleLabel.text = friendModel.intro;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.iconView.frame = CGRectMake(20, 5, 40, 40);
    self.titleLabel.frame = CGRectMake(70, 5, 200, 20);
    self.subtitleLabel.frame = CGRectMake(70, 25, 200, 20);
}

@end
