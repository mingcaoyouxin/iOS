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
-(int)middleNumberOfSequence:(int *)array withBegin:(int)p withEnd:(int)r;

//求n个数字的第k小的元素
-(int)theKthNumberOfSequence:(int *)array withBegin:(int)p withEnd:(int)r withKth:(int)k;

//序列中的最小值
-(int)minNumberOfSequence:(int *)array withBegin:(int)p withEnd:(int)r;

//同时获得序列中的最小和最大值
-(int *)minAndMaxOfSequence:(int *)array withBegin:(int)p withEnd:(int)r;

@end
