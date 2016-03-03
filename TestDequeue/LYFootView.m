//
//  LYFootView.m
//  TestDequeue
//
//  Created by ly on 16/3/3.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "LYFootView.h"
#import "LYGroupModel.h"

@interface LYFootView ()
@property (nonatomic, strong) UILabel *isOpenLabel;
@end

@implementation LYFootView
+ (instancetype)footViewWith:(UITableView *)tableView
{
    LYFootView *footView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"foot"];
    if (!footView) {
        footView = [[self alloc] initWithReuseIdentifier:@"foot"];
    }
    return footView;
}
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}
- (UILabel *)isOpenLabel
{
    if (!_isOpenLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor redColor];
        [self addSubview:label];
        self.isOpenLabel = label;
    }
    return _isOpenLabel;
}
- (void)setGropModel:(LYGroupModel *)gropModel
{
    if (_gropModel != gropModel) {
        _gropModel = gropModel;
    }
    NSString *temStr;
    if (gropModel.isOpen) {
        temStr = @"YES";
    }else{
        temStr = @"NO";
    }
    self.isOpenLabel.text = temStr;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.isOpenLabel.frame = self.bounds;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if ([_footViewDelegate respondsToSelector:@selector(footDelegate:)]) {
        [_footViewDelegate footDelegate:self];
    }
}
@end
