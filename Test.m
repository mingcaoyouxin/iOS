//
//  Test.m
//  Algorithm
//
//  Created by 浩 董 on 15/9/5.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import "Test.h"

@implementation Test

+(char *)func:(char *)str length:(NSUInteger)length{
    NSUInteger count = 0;
    
    NSUInteger mid = (length - 1) / 2;
    for (NSUInteger i = 0; i < length-1; i++) {
        if (i != mid && str[i]== '#') {
            count++;
        }
    }
    NSUInteger newLength = length - count;
    char  *newArray = (char *)malloc(sizeof(char)* newLength);
    for (int i = 0; i < length; i++) {
        if (str[i]!= '#' || i == mid || i == length - 1) {
            *newArray = str[i];
            newArray++;
        }
    }
    return  newArray;
}



@end
