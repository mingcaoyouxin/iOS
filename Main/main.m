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
        NSLog(@"the sqrt of %f is %d",number,[Sqrt ceilSqrtOfNumber:number]);

        for (number = 0; number <= 100; number++) {
            NSLog(@"the sqrt of %f is %d",number,[Sqrt ceilSqrtOfNumber:number]);
        }
        
        number = 37;
        array = [DoorWithLock doorsWithLockWithDoorNumber:number];
        for (int i = 1; i <= number; i++) {
            NSNumber *number = array[i];
            if (number.integerValue == 1) {
                NSLog(@"the door of %d is open",i);
            }else{
                NSLog(@"the door of %d is closed",i);

            }
        }
        
        
        int sortArray[13] = {-1,2,11,3,23,1,87,1,23,46,1,44,11};
        OrderStatistic *orderStatistics = [[OrderStatistic alloc] init];
        int *result =[orderStatistics minAndMaxOfSequence:sortArray withBegin:p withEnd:r];
        NSLog(@"min = %d max = %d ",result[0],result[1]);
        
        int kth = 12;
        int kthNumber = [orderStatistics theKthNumberOfSequence:sortArray withBegin:p withEnd:r withKth:kth];
        printf("第%d小的数为：%d\n",kth,kthNumber);
        printf("中位数是：%d\n",[orderStatistics middleNumberOfSequence:sortArray withBegin:p withEnd:r]);
        
        Sort *sort = [[Sort alloc] init];
        int *pResult = [sort quickSortOfArray:sortArray withBegin:p withEnd:r];
        for (int i = 0; i < 13; i++) {
            printf("%d " ,pResult[i]);
        }
        printf("\n");

        int heaps[]={0,-1,2,11,3,23,1,87,1,23,46,1,44,11};
        Heap heapResult = [sort heapSortOfArray:heaps withLength:13];
        for (int i = 1; i <= 13 ; i++) {
            printf("%d " ,heapResult->elements[i]);
        }
        printf("\n");

        
        MaxSubSequenceSum *subSequence = [[MaxSubSequenceSum alloc] init];
        static int A[] = TestArrayE;
        
        NSLog(@"Maxsum = %d\n",[subSequence maxSubsequenceSum:A withLength:sizeof(A)/sizeof(A[0])]);
        
        int treeArray[]={15,6,3,4,2,7,13,9,18,20,17};
        int length = sizeof(treeArray)/sizeof(treeArray[0]);
        BinarySearchTree *binary = [[BinarySearchTree alloc] init];
        SearchTree searchTree = NULL;
        for (int i = 0; i < length; i++) {
            searchTree = [binary insertElement:treeArray[i] inTree:searchTree];
        }
        [binary printTree:searchTree];
        printf("\n");
        struct TreeNode *node = [binary successorOfElement:17 inTree:searchTree];
        if (node) {
            NSLog(@"%d",node->element);
        }
        
        searchTree = [binary deleteElement:15 inTree:searchTree];
        [binary printTree:searchTree];
        
        printf("\n");
        int heapArray[] = {-1,4,1,3,2,16,9,10,14,8,7};
        BinaryHeap *binaryHeap = [BinaryHeap new];
        struct HeapStruct *heap = [binaryHeap buildMaxHeap:heapArray withSize:10];
        for(int i = 1; i <= 10; i++)
            NSLog(@"%d",heap->elements[i]);
        
        int sortedArray[] = {-1,-1,1,2,2,2,3,4,4};
        Array *arrayPro= [[Array alloc] init];
        length =[arrayPro removeDuplicates:sortedArray length:9];
        for (int i = 0; i < length; i++) {
            printf("%d ",sortedArray[i]);
        }
        printf("\n");
        
        int roatedArray[] = {1,3,1,1,1};
        printf("%d\n", [arrayPro searchInDuplicatedArray:roatedArray length:5 target:3]);
        
        int sortedA[] = {1,2,3,6,9,12};
        int sortedB[] = {2,5,7,8,9,18};
        printf("%f\n", [arrayPro findMedianSortedArraysOfFirstArray:sortedA firstLength:sizeof(sortedA)/sizeof(int) secondArray:sortedB secondeLength:sizeof(sortedB)/sizeof(int)]);
        printf("%f\n", [arrayPro findMedianSortedArraysOfFirstArray:sortedA firstLength:0 secondArray:sortedB secondeLength:0]);
        
        int x =9999;
        int countx=0;
        while (x) {
            countx++;
            x = x&(x-1);
        }
        NSLog(@"%d",countx);
        
        int colors[4][4] = { {0,0, 1, 1},{1, 0,1,0} ,{0,1,1,0},{0,0,1,0}};
        int pivots[3][3] = {{2,2},{3,3},{4,4}};
        int i = 0;
        for ( i = 0; i < 3; i++) {
            int x = pivots[i][0] - 1;
            int y = pivots[i][1] - 1;
            if (x - 1 >= 0) {
                colors[x-1][y] ^= 1;
            }
            if (x + 1 <= 3) {
                colors[x+1][y] ^= 1;
            }
            if ( y - 1 >=0) {
                colors[x][y-1] ^= 1;
            }
            if (y + 1 <= 3) {
                colors[x][y+1] ^= 1;
            }
        }
        for (int i =0; i < 4; i++) {
            for (int j = 0; j < 4; j++) {
                printf("%d",colors[i][j]);
            }
        }
        
        int a[5]={1,3,5,7,9};
        int *ps = (int *)(&a+1);
        printf("%d %d",*(a+1),*(ps-1));
        
        
        
        
        
    }
    return 0;
}
