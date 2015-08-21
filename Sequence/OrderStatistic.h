//
//  OrderStatistic.h 顺序统计
//  Algorithm
//
//  Created by 浩 董 on 15/8/17.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderStatistic : NSObject

//这里不把array作为property，为了语言上的扩展性



//求n个数字的中值（即其中第n/2（上取整）个最小的元素）
-(NSInteger)middleNumberOfSequence:(NSInteger *)array withBegin:(NSInteger)p withEnd:(NSInteger)r;

//求n个数字的第k小的元素
-(NSInteger)theKthNumberOfSequence:(NSInteger *)array withBegin:(NSInteger)p withEnd:(NSInteger)r withKth:(NSInteger)k;

//序列中的最小值
-(NSInteger)minNumberOfSequence:(NSInteger *)array withBegin:(NSInteger)p withEnd:(NSInteger)r;

//同时获得序列中的最小和最大值
-(NSInteger *)minAndMaxOfSequence:(NSInteger *)array withBegin:(NSInteger)p withEnd:(NSInteger)r;

@end
