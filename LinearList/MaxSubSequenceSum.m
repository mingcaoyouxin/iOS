//
//  MaxSubSequenceSum.m
//  Algorithm
//
//  Created by 浩 董 on 15/8/18.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import "MaxSubSequenceSum.h"
#import "Helper.h"
#define MaxSubSequenceSum_NlogNAlgorithm

@implementation MaxSubSequenceSum

/* Define one of CubicAlgorithm, QuadraticAlgorithm, NlogNAlgorithm,
 * or LinearAlgorithm to get one algorithm compiled */

#ifdef MaxSubSequenceSum_CubicAlgorithm

-(int)maxSubsequenceSum:(const int[])A withLength:(int) N
{
    int thisSum, maxSum, i, j, k;
    maxSum = 0;
    for(i = 0; i < N; i++)
        for(j = i; j < N; j++)
        {
            thisSum = 0;
            for(k = i; k <= j; k++)
                thisSum += A[k];
            
            if(thisSum > maxSum)
                maxSum = thisSum;
        }
    return maxSum;
}

#endif


#ifdef MaxSubSequenceSum_QuadraticAlgorithm

-(int)maxSubsequenceSum:(const int[])A withLength:(int) N
{
    int thisSum, maxSum, i, j;
    maxSum = 0;
    for(i = 0; i < N; i++)
    {
        thisSum = 0;
        for(j = i; j < N; j++)
        {
            thisSum += A[j];
            if(thisSum > maxSum)
                maxSum = thisSum;
        }
    }
    return maxSum;
}

#endif



#ifdef MaxSubSequenceSum_NlogNAlgorithm
/*
 *分治法的思想
 */

-(int) maxSubSumOfArray:(const int[]) A left:(int) Left right:(int) Right
{
    int maxLeftSum, maxRightSum;
    int maxLeftBorderSum, maxRightBorderSum;
    int LeftBorderSum, RightBorderSum;
    int Center, i;
    
    if(Left == Right){
//        if(A[Left] > 0)
//            return A[Left];
//        else
//            return 0;
        return A[Left];
    }
    
    Center = (Left + Right) / 2;
    maxLeftSum = [self maxSubSumOfArray:A left:Left right:Center];
    maxRightSum = [self maxSubSumOfArray:A left:Center + 1 right:Right];
    
    maxLeftBorderSum = MININT32; LeftBorderSum = 0;
    for(i = Center; i >= Left; i--)
    {
        LeftBorderSum += A[i];
        if(LeftBorderSum > maxLeftBorderSum)
            maxLeftBorderSum = LeftBorderSum;
    }
    
    maxRightBorderSum = MININT32; RightBorderSum = 0;
    for(i = Center + 1; i <= Right; i++)
    {
        RightBorderSum += A[i];
        if(RightBorderSum > maxRightBorderSum)
            maxRightBorderSum = RightBorderSum;
    }
    
    return [Help maxOfFirst:maxLeftSum second:maxRightSum third:maxLeftBorderSum + maxRightBorderSum];
}

-(int)maxSubsequenceSum:(const int[])A withLength:(int) N
{
    return [self maxSubSumOfArray:A left:0 right:N-1];
}

#endif


#ifdef MaxSubSequenceSum_LinearAlgorithm

-(int)maxSubsequenceSum:(const int[])A withLength:(int) N
{
    int thisSum, maxSum, j;
    maxSum = MININT32;
    thisSum = 0;
    for(j = 0; j < N; j++)
    {
        thisSum += A[j];
        //这里的考虑 如果以元素A[j]结尾的序列还没有该元素大 则 最大连续子序列为A[j]
        if(A[j] >= thisSum){
            thisSum = A[j];
        }
        if(thisSum > maxSum)
            maxSum = thisSum;
    }
    return maxSum;
}

#endif



@end
