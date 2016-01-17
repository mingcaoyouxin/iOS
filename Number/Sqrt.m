//
//  Sqrt.m
//  Algorithm
//
//  Created by 浩 董 on 15/8/16.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import "Sqrt.h"

@implementation Sqrt


//求一个数的平方根可以通过下列公式逼近
//利用牛顿迭代法，x(k+1) = x(k) - f(x(k)) / f'(x(k))
//因此对于求平方根，牛顿迭代式为：x(k+1) = x(k) - (x(k)^2 - n) / 2x(k) = (x(k) + n / x (k)) / 2
+(double)howSqrt:(double)number withPrintBit:(int) bit
{
    if( number < 0 )
    {
        NSLog(@"wrong input number ,less than 0");
        return -1;
    }
    
    double prev;
    double new = 1 ;
    do{
        prev = new;
        new = ( prev + number / prev ) / 2;
        printf("%.20e\n", new);
    } while( prev != new );
    //NSLog(@"the sqrt of %f is %@\n",number,@"f");
    printf("the sqrt of %f is %.20f\n",number,prev);
    return prev;
}


//二分查找法计算一个数的平方根 下取整
+(int)ceilSqrtOfNumber:(double)number
{
    int left = 0, right = (number + 1) / 2 ;//这里不用right不用从number开始，因为（n+1)/2 >= n^0.5
    while (left <=  right) {
        long mid = (long)(left + right) / 2;//这里用long类型保存mid，因为可能溢出，如测试用例2147395599，mid * mid 会溢出
        //int mid = ( left + right ) / 2;
        if (mid * mid < number) {
            left = (int)mid + 1;
        }else if(mid * mid >  number){
            right = (int)mid -1;
        }else{
            return (int)mid;
        }
    }
    return right;
}





@end
