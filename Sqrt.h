//
//  Sqrt.h
//  Algorithm
//
//  Created by 浩 董 on 15/8/16.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sqrt : NSObject

//求一个数的平方根，保留小数bit位
+(double)howSqrt:(double)number withPrintBit:(NSInteger) bit;

//求一个数的平方根，下取整
+(NSInteger)ceilSqrtOfNumber:(double)number;

@end
