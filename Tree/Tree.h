//
//  Tree.h
//  Algorithm
//
//  Created by 浩 董 on 15/8/21.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//
typedef NSInteger ElementType;

#ifndef Base_Tree_h
#define Base_Tree_h
struct BaseTreeNode;
typedef struct BaseTreeNode *BasePtrToNode;

//对于每一个结点，因为不知道其孩子的具体个数，因此不可能在结构体中保存对每个孩子的指针引用，这里只保存两个指针
//一个是向下的箭头，一个是向右的箭头这样便可以表示一颗任意的树了
struct BaseTreeNode{
    ElementType element;
    BasePtrToNode firstChild;//向下的箭头 指向第一个儿子
    BasePtrToNode nextSibling;//向右的箭头，指向下一兄弟
};
#endif

#ifndef Binary_Tree_h
#define Binary_Tree_h
//定义二叉树binary tree的结构体
struct TreeNode;
typedef struct TreeNode *PtrToNode;
struct TreeNode{
    ElementType element;
    PtrToNode left;
    PtrToNode right;
    PtrToNode parent;//指向父节点，有些书籍中并未给出该指针
};
#endif