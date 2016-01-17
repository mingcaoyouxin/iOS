//
//  PriorityQueue.m
//  Algorithm
//
//  Created by 浩 董 on 15/8/24.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import "BinaryHeap.h"

@implementation BinaryHeap


/*算法思想：(注意，在调用该方法时，我们假定以left(i)和right(i)为根的两个二叉树都是最大堆)
 *在算法的每一步里，从元素A[i],A[LEFT(i)],A[RIGHT(i)]中找出最大的，并将其下标存在largest中
 *如果A[i]是最大的，则以i为根的子树已经是最大堆，程序结束
 *否则，i的某个子结点中有最大元素，则交换A[i]与A[largest]，从而使i及其子女满足堆性质
 *下标为largest的结点在交换后的值是A[i],以该结点为根的子树又有可能违反最大堆性质，则要对该子树递归调用maxHeapify
 */
//保持堆的性质，复杂度O(lgn)
-(void)maxHeapify:(Heap)heap inPosition:(int)i
{
    if (heap == NULL || i <= 0) {
        return;
    }
    int l = LEFT(i);
    int r =  RIGNT(i);
    int largest;
    //找出结点i以及它的两个子节点三者中的最大值，赋给largest
    if (l <= heap->size && heap->elements[l] > heap->elements[i]) {
        largest = l;
    }else{
        largest = i;
    }
    if (r <= heap->size && heap->elements[r] > heap->elements[largest]) {
        largest = r;
    }
    //如果i结点不是三者中的最大值，则需要交换i结点与largest结点
    if (i != largest) {
        //拿结点i的关键字值与largest结点的值交换，则满足堆序性
        ElementType temp = heap->elements[i];
        heap->elements[i] = heap->elements[largest];
        heap->elements[largest] = temp;
        //交换结点后被交换结点可能不满足堆序性，需要再次进行保持堆的性质
        [self maxHeapify:heap inPosition:largest];
    }
}

//构建最大堆
-(Heap)buildMaxHeap:(int [])A withSize:(int)size
{
    struct HeapStruct *heap = malloc(sizeof(struct HeapStruct));
    if (heap == NULL) {
        NSLog(@"out of space!");
        return 0;
    }
    heap->size = size;
    heap->elements = A;
    //因为A[n/2+1]...A[n]均是叶子节点，所以从n/2开始，而且必须倒着
    //因为maxHeapify必须保证他的左右孩子均是最大堆
    for (int i = size / 2; i >= 1; i--) {
        [self maxHeapify:heap inPosition:i];
    }
    return heap;
}
@end
