//
//  LYGroupModel.h
//  LY_QQListDemo
//
//  Created by ly on 16/3/3.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYGroupModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *online;
@property (nonatomic, copy) NSArray *friends;
@property (nonatomic, assign) BOOL isOpen;

+ (instancetype)groupModelWithDic:(NSDictionary *)dict;

- (instancetype)initWithDic:(NSDictionary *)dict;

@end
