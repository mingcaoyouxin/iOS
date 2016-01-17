//
//  Sort.m
//  Algorithm
//
//  Created by 浩 董 on 15/8/17.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import "Sort.h"
#import "BinaryHeap.h"

@implementation Sort

#pragma mark - 快速排序
-(int *)quickSortOfArray:(int *)array withBegin:(int)p withEnd:(int)r
{
    if(p < r){
        int q = [self partitionOfArray:array withBegin:p withEnd:r];
        [self quickSortOfArray:array withBegin:q+1 withEnd:r];
        [self quickSortOfArray:array withBegin:p withEnd:q-1];
    }
    return array;
}

-(int)partitionOfArray:(int *)array withBegin:(int)p withEnd:(int)r
{
    //选取最右边元素作为主元
    int mainElement = array[r];
    int i = p - 1;//i初始指向开始的前一个位置
    //注意次处的指针j后移到r-1便停止，因为最后一个元素是主元
    for (int j = p; j < r; j++) {
        if (array[j] <= mainElement) {
            //如果比主元小，就放到第i+1个位置，同时把该元素与j位置元素交换，也就是放到比x小的位置，
            //如果比主元大，指针j后移。i指针不变
            i++;
            int temp = array[i];
            array[i] = array[j];
            array[j] = temp;
        }
    }
    //最后把主元放到i+1位置，把该位置的数放到r位置
    int temp = array[i+1];
    array[i+1] = array[r];
    array[r] = temp;
    //返回主元所在的位置，这样主元前面的元素比他小，后面的元素比他大
    return i+1;
}


//随机选取主元的位置，并把该位置的元素放到r处，作为主元位置
-(int *)randomizedQuickSortOfArray:(int *)array withBegin:(int)p withEnd:(int)r
{
    if(p < r){
        int q = [self randomizedPartitionOfArray:array withBegin:p withEnd:r];
        [self randomizedQuickSortOfArray:array withBegin:q+1 withEnd:r];
        [self randomizedQuickSortOfArray:array withBegin:p withEnd:q-1];
    }
    return array;
}

-(int)randomizedPartitionOfArray:(int *)array withBegin:(int)p withEnd:(int)r
{
    srand((unsigned) time(NULL));//以时间作为种子
    int i = rand()%(r-p) + p;//随机生成一个位置，使该位置的元素作为主元，放到r位置
    int temp = array[i];
    array[i] = array[r];
    array[r] = temp;
    return [self partitionOfArray:array withBegin:p withEnd:r];
}


#pragma mark - 堆排序
-(Heap)heapSortOfArray:(int *)array withLength:(int)size
{
    BinaryHeap *binaryHeap = [[BinaryHeap alloc] init];
    //首先建立最大堆
    Heap heap =[binaryHeap buildMaxHeap:array withSize:size];
    for(int i = size; i >= 2; i--){
        //将堆的顶点与i位置的元素交换
        int temp = heap->elements[1];
        heap->elements[1] = heap->elements[i];
        heap->elements[i] = temp;
        heap->size --;
        //保持堆顶点的最大堆性质
        [binaryHeap maxHeapify:heap inPosition:1];
    }
    return heap;
    
}

@end
