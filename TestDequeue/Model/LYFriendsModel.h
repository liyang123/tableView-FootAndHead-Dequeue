//
//  LYFriendsModel.h
//  LY_QQListDemo
//
//  Created by ly on 16/3/3.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYFriendsModel : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSNumber *vip;

+ (instancetype)friendsModelWithDic:(NSDictionary *)dict;

- (instancetype)initWithDic:(NSDictionary *)dict;
@end
