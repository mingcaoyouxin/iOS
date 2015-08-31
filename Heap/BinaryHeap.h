//
//  BinaryHeap.h
//  Algorithm
//  优先队列的方法的各种实现
//  Created by 浩 董 on 15/8/24.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Heap.h"
typedef struct HeapStruct *PriorityQueue;
typedef struct HeapStruct *Heap;
@interface BinaryHeap : NSObject

//保持堆的性质
-(void)maxHeapify:(Heap) heap inPosition:(NSInteger) i;

//建堆
-(Heap)buildMaxHeap:(NSInteger [])A withSize:(NSInteger)size;
@end
