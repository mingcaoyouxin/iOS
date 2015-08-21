//
//  Sort.h
//  Algorithm
//
//  Created by 浩 董 on 15/8/17.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sort : NSObject

#pragma mark - 快速排序
//快排，以r位置元素作为主元
-(NSInteger *)quickSortOfArray:(NSInteger *)array withBegin:(NSInteger)p withEnd:(NSInteger)r;

//分解，使下标q之前的元素均小于它 之后的元素都大于他,选取r位置元素作为主元
-(NSInteger)partitionOfArray:(NSInteger *)array withBegin:(NSInteger)p withEnd:(NSInteger)r;

//选取随机元素作为主元，并放到r位置
-(NSInteger *)randomizedQuickSortOfArray:(NSInteger *)array withBegin:(NSInteger)p withEnd:(NSInteger)r;

-(NSInteger)randomizedPartitionOfArray:(NSInteger *)array withBegin:(NSInteger)p withEnd:(NSInteger)r;

@end
