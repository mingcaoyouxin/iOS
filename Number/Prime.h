//
//  Sieve.h
//  Algorithm
//
//  Created by 浩 董 on 15/8/13.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSArray+Init.h"
@interface Prime : NSObject




//埃拉托色尼算法：生成不大于num的连续质数序列
-(NSArray*) sequentPrimeNumberInNumber:(NSInteger) num;

@end
