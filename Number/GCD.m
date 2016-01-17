//
//  Euclid.m
//  GCD
//  公式 GCD(m,n) = GCD(n,m mod n) (m > n)
//  终止条件： m mode n == 0
//  Created by 浩 董 on 15/8/13.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import "GCD.h"

@implementation GCD

-(int)euclidWithFirstNumber:(int)first SecondNumber:(int)second
{
    if (first == 0 || second == 0) {
        return 0;
    }
    int minNum = MIN(first, second);
    int maxNum = MAX(first, second);
    while (maxNum % minNum != 0) {
        minNum = maxNum % minNum;
        maxNum = minNum;
    }
    return minNum;
}


@end
