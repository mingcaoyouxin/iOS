//
//  NSMutableArray+Init.m
//  Algorithm
//
//  Created by 浩 董 on 15/8/13.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import "NSMutableArray+Init.h"

@implementation NSMutableArray (Init)

-(NSMutableArray *)initWithCapacity:(NSInteger)capacity withInitNumber:(NSInteger)initNumber isSequent:(BOOL)isSequent
{
    self = [super init];
    if (!self) {
        return NULL;
    }
    for (NSInteger i = 0; i < capacity; i++) {
        if (isSequent) {
            [self addObject:[NSNumber numberWithInteger:i]];
        }else{
            [self addObject:[NSNumber numberWithInteger:initNumber]];
        }
    }
    return self;
}


@end
