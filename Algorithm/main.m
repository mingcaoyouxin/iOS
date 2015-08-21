//
//  main.m
//  Algorithm
//
//  Created by 浩 董 on 15/8/13.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Header.h"

#define p 0
#define r 12
#define TestArrayA {-2, 11, -4, 13, -5, -2}
#define TestArrayB {-10, 1, 2, 3, 4, -5, -23, 3, 7, -21}
#define TestArrayC {5, -8, 3, 2, 5, 0}
#define TestArrayD {10}
#define TestArrayE {-1, -5, -2}
#define TestArrayF {-1, 0, -1}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        GCD *gcd = [[GCD alloc] init];
        NSLog(@"%ld",(long)[gcd euclidWithFirstNumber:1 SecondNumber:2]);
        
        NSLog(@"\n");
        
        int primeNumber = 25;
        Prime *prime = [[Prime alloc] init];
        NSArray *array=[prime sequentPrimeNumberInNumber:primeNumber];
        for (int i = 2; i <= primeNumber; i++) {
            NSNumber *number = array[i];
            if (number.integerValue == 1) {
                NSLog(@"%d",i);
            }
        }
        
        [Sqrt howSqrt:2 withPrintBit:8];
        
        double number = 2147395599;
        NSLog(@"the sqrt of %f is %ld",number,[Sqrt ceilSqrtOfNumber:number]);

        for (number = 0; number <= 100; number++) {
            NSLog(@"the sqrt of %f is %ld",number,[Sqrt ceilSqrtOfNumber:number]);
        }
        
        number = 37;
        array = [DoorWithLock doorsWithLockWithDoorNumber:number];
        for (NSInteger i = 1; i <= number; i++) {
            NSNumber *number = array[i];
            if (number.integerValue == 1) {
                NSLog(@"the door of %ld is open",i);
            }else{
                NSLog(@"the door of %ld is closed",i);

            }
        }
        
        
        NSInteger sortArray[13] = {-1,2,11,3,23,1,87,1,23,46,1,44,11};
        OrderStatistic *orderStatistics = [[OrderStatistic alloc] init];
        NSInteger *result =[orderStatistics minAndMaxOfSequence:sortArray withBegin:p withEnd:r];
        NSLog(@"min = %ld max = %ld ",result[0],result[1]);
        
        NSInteger kth = 12;
        NSInteger kthNumber = [orderStatistics theKthNumberOfSequence:sortArray withBegin:p withEnd:r withKth:kth];
        printf("第%ld小的数为：%ld\n",kth,kthNumber);
        printf("中位数是：%ld\n",[orderStatistics middleNumberOfSequence:sortArray withBegin:p withEnd:r]);
        
        Sort *sort = [[Sort alloc] init];
        NSInteger *pResult = [sort quickSortOfArray:sortArray withBegin:p withEnd:r];
        for (NSInteger i = 0; i < 13; i++) {
            printf("%ld " ,pResult[i]);
        }
        printf("\n");
        MaxSubSequenceSum *subSequence = [[MaxSubSequenceSum alloc] init];
        static NSInteger A[] = TestArrayE;
        
        NSLog(@"Maxsum = %ld\n",[subSequence maxSubsequenceSum:A withLength:sizeof(A)/sizeof(A[0])]);

    }
    return 0;
}
