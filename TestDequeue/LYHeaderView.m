


//
//  LYHeaderView.m
//  TestDequeue
//
//  Created by ly on 16/3/3.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "LYHeaderView.h"
#import "LYGroupModel.h"
@interface LYHeaderView ()
@property (nonatomic, strong) UIButton *arrowBtn;
@end

@implementation LYHeaderView

+ (instancetype)headerViewWith:(UITableView *)tableView
{
    LYHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    if (!headerView) {
        headerView = [[self alloc] initWithReuseIdentifier:@"header"];
    }
    return headerView;
}
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}
- (UIButton *)arrowBtn
{
    if (!_arrowBtn) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"header_bg"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"header_bg_highlighted"] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        // 距离
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        //内容的水平对齐方式
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        button.imageView.contentMode = UIViewContentModeCenter;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        //不裁剪图片
        button.imageView.clipsToBounds = NO;
        [self addSubview:button];
        self.arrowBtn = button;
    }
    return _arrowBtn;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.arrowBtn.frame = self.bounds;
}
- (void)setGroupModel:(LYGroupModel *)groupModel
{
    if (_groupModel != groupModel) {
        _groupModel = groupModel;
    }
    [self.arrowBtn setTitle:[NSString stringWithFormat:@"%@", groupModel.name] forState:UIControlStateNormal];
}
- (void)buttonAction:(UIButton *)sender
{
    if ([_headerViewDelegate respondsToSelector:@selector(clieckHeaderView:)]) {
        [_headerViewDelegate clieckHeaderView:self];
    }
}


@end
