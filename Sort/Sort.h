//
//  Sort.h
//  Algorithm
//
//  Created by 浩 董 on 15/8/17.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Heap.h"
#import "Heap.h"
typedef struct HeapStruct *Heap;

@interface Sort : NSObject

#pragma mark - 快速排序
//快排，以r位置元素作为主元
-(NSInteger *)quickSortOfArray:(NSInteger *)array withBegin:(NSInteger)p withEnd:(NSInteger)r;

//分解，使下标q之前的元素均小于它 之后的元素都大于他,选取r位置元素作为主元
-(NSInteger)partitionOfArray:(NSInteger *)array withBegin:(NSInteger)p withEnd:(NSInteger)r;

//选取随机元素作为主元，并放到r位置
-(NSInteger *)randomizedQuickSortOfArray:(NSInteger *)array withBegin:(NSInteger)p withEnd:(NSInteger)r;

-(NSInteger)randomizedPartitionOfArray:(NSInteger *)array withBegin:(NSInteger)p withEnd:(NSInteger)r;

#pragma mark - 堆排序
/*堆排序是一种原地（in place）排序算法：在任何时候，数组中只有常数个元素存储在输入数组以外*/
-(Heap)heapSortOfArray:(NSInteger *)array withLength:(NSInteger)size;

@end
