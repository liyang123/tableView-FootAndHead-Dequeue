//
//  LYFriendsModel.m
//  LY_QQListDemo
//
//  Created by ly on 16/3/3.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "LYFriendsModel.h"

@implementation LYFriendsModel
+ (instancetype)friendsModelWithDic:(NSDictionary *)dict
{
    return [[self alloc] initWithDic:dict];
}
- (instancetype)initWithDic:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.icon = dict[@"icon"];
        self.intro = dict[@"intro"];
        self.name = dict[@"name"];
        self.vip = dict[@"vip"];
    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
}
@end
