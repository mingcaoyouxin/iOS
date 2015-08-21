//
//  OrderStatistic.m
//  Algorithm
//
//  Created by 浩 董 on 15/8/17.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import "OrderStatistic.h"
#import "Helper.h"
#import "Help.h"
#import "Sort.h"
#define MinAndMax_Double

@implementation OrderStatistic

-(NSInteger)middleNumberOfSequence:(NSInteger *)array withBegin:(NSInteger)p withEnd:(NSInteger)r
{
    if(p == r)
        return array[p];
    if(array == NULL)
        return -1;
    NSInteger middle,count = r - p + 1;
    
    //如果有偶数个元素
    if ((r - p + 1) % 2 == 0) {
      middle = count / 2;
    }else{
        middle =  (count + 1) / 2;
    }
    return [self theKthNumberOfSequence:array withBegin:p withEnd:r withKth:middle];
}

-(NSInteger)theKthNumberOfSequence:(NSInteger *)array withBegin:(NSInteger)p withEnd:(NSInteger)r withKth:(NSInteger)k
{
    if(array == NULL)
        return -1;
    if(p == r) {
        return array[p];
    }
    Sort *sort = [[Sort alloc] init];
    NSInteger q = [sort randomizedPartitionOfArray:array withBegin:p withEnd:r];//首先根据分解法确定一个位置q，其前面的数比他小，后面的数比他大，则array[q]便是第q-p+1小（没有第0小）
    NSInteger i = q - p + 1;
    if (i == k) {
        return array[q];
    }
    else if (i < k){
        return [self theKthNumberOfSequence:array withBegin:q+1 withEnd:r withKth:k-i];
    }
    else{
        return [self theKthNumberOfSequence:array withBegin:p withEnd:q-1 withKth:k];
    }    
}

-(NSInteger)minNumberOfSequence:(NSInteger *)array withBegin:(NSInteger)p withEnd:(NSInteger)r
{
    NSInteger length = r - p + 1;
    if(array == NULL || length <= 0)
        return -1;
    NSInteger min = array[0];
    for (NSInteger i = p ; i <= r; i++) {
        if (array[i] < min) {
            min = array[i];
        }
    }
    return min;
}

#ifdef MinAndMax_Double

//同时求出序列中的最小值和最大值
/**
 *如果单独求出min和max，总共需要比较2（n-1）次
 *但是这里我们不将每一个元素与当前的最小值和最大值比较，这样做的代价是每个元素需要2次比较，而是成对的处理元素
 *对于没对元素的最小值与min比较，最大值与max比较，这样对于每对元素总共比较3次，共n/2对，因此比较3n/2次，小于2n-2
 *对于初始情况，如果是奇数个元素，初始化min和max都为第0个元素，剩下的便可以两两成对
 *如果是偶数个元素，则把第0个与第1个元素的最小值和最大值分别赋给min与max
 */
-(NSInteger *)minAndMaxOfSequence:(NSInteger *) array withBegin:(NSInteger)p withEnd:(NSInteger)r
{
    if(array == NULL)
        return NULL;
    NSInteger min, max, temp,length = r - p + 1;
    //如果序列长度为偶数
    if(length % 2 == 0){
        NSInteger first = array[p];
        NSInteger second = array[p+1];
        min = MIN(first, second);
        max = MAX(first, second);
        temp = p + 2;//下一次比较从元素2开始比较
    }else{
        NSInteger first = array[p];
        min = first;
        max = min;
        temp = p + 1;//下一次比较从元素1开始比较
    }
    for (NSInteger i = temp; i <= r; i += 2) {
        NSInteger first = array[i];
        NSInteger second = array[i+1];
        if (min > MIN(first, second) ) {
            min = MIN(first, second);
        }
        if (max < MAX(first, second)) {
            max = MAX(first, second);
        }
    }
    NSInteger result[2];
    result[0] = min;
    result[1] = max;
    NSInteger *resultPointer = result;
    return resultPointer;
}

#endif



@end
