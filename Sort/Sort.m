//
//  Sort.m
//  Algorithm
//
//  Created by 浩 董 on 15/8/17.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import "Sort.h"

@implementation Sort

#pragma mark - 快速排序
-(NSInteger *)quickSortOfArray:(NSInteger *)array withBegin:(NSInteger)p withEnd:(NSInteger)r
{
    if(p < r){
        NSInteger q = [self partitionOfArray:array withBegin:p withEnd:r];
        [self quickSortOfArray:array withBegin:q+1 withEnd:r];
        [self quickSortOfArray:array withBegin:p withEnd:q-1];
    }
    return array;
}

-(NSInteger)partitionOfArray:(NSInteger *)array withBegin:(NSInteger)p withEnd:(NSInteger)r
{
    //选取最右边元素作为主元
    NSInteger mainElement = array[r];
    NSInteger i = p - 1;//i初始指向开始的前一个位置
    //注意次处的指针j后移到r-1便停止，因为最后一个元素是主元
    for (NSInteger j = p; j < r; j++) {
        if (array[j] <= mainElement) {
            //如果比主元小，就放到第i+1个位置，同时把该元素与j位置元素交换，也就是放到比x小的位置，
            //如果比主元大，指针j后移。i指针不变
            i++;
            NSInteger temp = array[i];
            array[i] = array[j];
            array[j] = temp;
        }
    }
    //最后把主元放到i+1位置，把该位置的数放到r位置
    NSInteger temp = array[i+1];
    array[i+1] = array[r];
    array[r] = temp;
    //返回主元所在的位置，这样主元前面的元素比他小，后面的元素比他大
    return i+1;
}


//随机选取主元的位置，并把该位置的元素放到r处，作为主元位置
-(NSInteger *)randomizedQuickSortOfArray:(NSInteger *)array withBegin:(NSInteger)p withEnd:(NSInteger)r
{
    if(p < r){
        NSInteger q = [self randomizedPartitionOfArray:array withBegin:p withEnd:r];
        [self randomizedQuickSortOfArray:array withBegin:q+1 withEnd:r];
        [self randomizedQuickSortOfArray:array withBegin:p withEnd:q-1];
    }
    return array;
}

-(NSInteger)randomizedPartitionOfArray:(NSInteger *)array withBegin:(NSInteger)p withEnd:(NSInteger)r
{
    srand((unsigned) time(NULL));//以时间作为种子
    NSInteger i = rand()%(r-p) + p;//随机生成一个位置，使该位置的元素作为主元，放到r位置
    NSInteger temp = array[i];
    array[i] = array[r];
    array[r] = temp;
    return [self partitionOfArray:array withBegin:p withEnd:r];
}
@end