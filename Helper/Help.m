//
//  Help.m
//  GCD
//
//  Created by 浩 董 on 15/8/13.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import "Help.h"

@implementation Help

//如果一个数是完全平方数，那么该数可以表示为 number = n^2 = 1 + 3 + 5 + ... + 2n-1
+(BOOL)isPerfectSqure:(int) number
{
    for(int i = 1 ; number > 0; i += 2)
        number -= i;
    return 0 == number;
}
//求一个数组的元素个数
+(int)lengthOfArray:(int *)array
{
    int count = 0;
    int *p = array;
    while (p != NULL) {
        p++;
        count++;
    }
    return count;
    
}
//三个数中的最大值
+(int) maxOfFirst:(int)A second:(int)B third:(int)C
{
    return A > B ? A > C ? A : C : B > C ? B : C;
}
//三个数中的最小值
+(int)minOfFirst:(int)A second:(int)B third:(int)C
{
    return A < B ? A < C ? A : C : B < C ? B : C;
}

@end

