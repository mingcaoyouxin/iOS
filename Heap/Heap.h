//
//  Heap.h
//  Algorithm
//
//  Created by 浩 董 on 15/8/24.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//
typedef int ElementType;
#define PARENT(i) ((i) >> 1)
#define LEFT(i) ((i) << 1)
#define RIGNT(i) (((i) << 1) + 1)

#ifndef Algorithm_Heap_h
#define Algorithm_Heap_h
//这里的堆实际上是二叉堆，满足两个性质：
//结构性：堆是一颗完全二叉树，也就是对于数组中任一位置i的元素，他的左儿子在位置2i上，它的右儿子在2i+1上，他的父亲在i/2上
//堆序性：对于除根结点以外的每个结点i,对于大根堆：A[PARENT(i)] >= A[i] 对于小根堆 A[PARENT(i)] <= A[i]
//堆排序算法使用最大堆，优先队列则使用最小堆
/*一些基本概念及性质
 *结点在堆中的高度：从本结点到叶子的最长简单下降路径上的边的数目
 *堆的高度：树根结点的高度
 *当用数组存储了n个元素的堆时，叶子结点的下标是n/2+1,n/2+2 ... n
 */
struct HeapStruct{
    ElementType capacity;//堆的最大容量
    ElementType size;//堆大小
    ElementType *elements;//存储堆元素的数组，注意数组的第0个位置不存放任何元素
};
#endif

