//
//  BinarySearchTree.h
//  二叉查找树,对于任意一个结点X,它的左子树中所有关键字值小于等于X的关键字值，它的右子树中所有的关键字值大于等于X的关键字值；
//  其改进的树有红黑树，AVL树，平衡二叉树，节点大小平衡树，伸展树
//  Algorithm
//
//  Created by 浩 董 on 15/8/21.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tree.h"
typedef struct TreeNode *SearchTree;
typedef struct TreeNode *Position;
@interface BinarySearchTree : NSObject

//置空树
-(SearchTree)makeEmpty:(SearchTree)tree;

//查找树中某元素
-(Position)findElement:(ElementType)element inTree:(SearchTree)tree;

//查找树中的最小元
-(Position)findMinInTree:(SearchTree)tree;

//查找树中的最大元
-(Position)findMaxInTree:(SearchTree)tree;

//插入元素
-(SearchTree)insertElement:(ElementType)element inTree:(SearchTree)tree;

//删除元素
-(SearchTree)deleteElement:(ElementType)element inTree:(SearchTree)tree;

//中序遍历遍历元素
-(void)printTree:(SearchTree)tree;

//查找中序遍历中元素的后继
-(Position)successorOfElement:(ElementType)element inTree:(SearchTree)tree;


@end
