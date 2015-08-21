//
//  main.m
//  GCD
//
//  Created by 浩 董 on 15/8/13.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCD.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //NSLog(@"Hello, World!");
        GCD *gcd = [[GCD alloc] init];
        NSLog(@"%ld",(long)[gcd euclidWithFirstNumber:1 SecondNumber:1]);
    }
    return 0;
}
