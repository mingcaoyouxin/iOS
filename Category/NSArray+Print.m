//
//  NSArray+Print.m
//  Algorithm
//
//  Created by 浩 董 on 15/8/16.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import "NSArray+Print.h"

@implementation NSArray (Print)

-(void)printArrayOfInteger:(NSArray *)array
{
    for (NSNumber *number  in array) {
        NSLog(@"%ld",number.integerValue);
    }
}
@end
