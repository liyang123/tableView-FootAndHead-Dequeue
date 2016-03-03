//
//  LYGroupModel.m
//  LY_QQListDemo
//
//  Created by ly on 16/3/3.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "LYGroupModel.h"
#import "LYFriendsModel.h"

@implementation LYGroupModel

+ (instancetype)groupModelWithDic:(NSDictionary *)dict
{
    return [[self alloc] initWithDic:dict];
}

- (instancetype)initWithDic:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.name = dict[@"name"];
        self.online = dict[@"online"];
        NSMutableArray *tempArr = [NSMutableArray array];
        for (NSDictionary *dic in dict[@"friends"]) {
            LYFriendsModel *friendModel = [LYFriendsModel friendsModelWithDic:dic];
            [tempArr addObject:friendModel];
        }
        self.friends = tempArr;
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}
@end
