//
//  BinarySearchTree.m
//  Algorithm
//
//  Created by 浩 董 on 15/8/21.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import "BinarySearchTree.h"
#define BinaryTree_Recursion

@implementation BinarySearchTree

-(SearchTree)makeEmpty:(SearchTree)tree
{
    if (tree != NULL) {
        [self makeEmpty:tree ->left];
        [self makeEmpty:tree ->right];
        free(tree);
    }
    return NULL;
}
#pragma mark - 递归算法
#ifdef BinaryTree_Recursion
//时间复杂度O(h) h为树高,递归算法
-(Position)findElement:(ElementType)element inTree:(SearchTree)tree
{
    if(tree == NULL || tree->element == element){
        return tree;
    }
    //如果element比根结点关键字值大，那么在右子树中递归查找
    if (tree->element < element) {
        return [self findElement:element inTree:tree->right];
    }else{
        return [self findElement:element inTree:tree->left];
    }
}
-(Position)findMinInTree:(SearchTree)tree
{
    if(tree == NULL || tree->left == NULL)
        return  tree;
    return [self findMinInTree:tree->left];
}

-(Position)findMaxInTree:(SearchTree)tree
{
    if(tree == NULL || tree->right == NULL)
        return  tree;
    return [self findMaxInTree:tree->right];
    
}
-(SearchTree)insertElement:(ElementType)element inTree:(SearchTree)tree
{
    //如果结点为空，说明已经递归到最右或者最左了，则新建一个结点，并将其父节点的左指针或右指针指向他
    if (tree == NULL) {
        tree = malloc(sizeof(struct TreeNode));
        if (tree == NULL) {
            NSLog(@"out of space!");
            return 0;
        }
        tree->element = element;
        tree->left = NULL;
        tree->right = NULL;
    }
    else if (element >= tree->element) {
        tree->right = [self insertElement:element inTree:tree->right];
    }else{
        tree->left = [self insertElement:element inTree:tree->left];
    }
    return tree;
    
}
-(SearchTree)deleteElement:(ElementType)element inTree:(SearchTree)tree
{
    if (tree == NULL) {
        return tree;
    }
    return tree;
}
#endif

#pragma mark - 非递归算法
#ifndef BinaryTree_Recursion
-(Position)findElement:(ElementType)element inTree:(SearchTree)tree
{
    while (tree !=NULL && tree->element != element) {
        if (tree->element < element) {
            tree = tree->right;
        }else{
            tree = tree->left;
        }
    }
    return tree;
}

-(Position)findMinInTree:(SearchTree)tree
{
    if(tree == NULL)
        return  tree;
    while (tree->left) {
        tree = tree->left;
    }
    return tree;
}

-(Position)findMaxInTree:(SearchTree)tree
{
    if(tree == NULL)
        return  tree;
    while (tree->right) {
        tree = tree->right;
    }
    return tree;
}

-(SearchTree)insertElement:(ElementType)element inTree:(SearchTree)tree
{
    
    
    return NULL;
}

-(SearchTree)deleteElement:(ElementType)element inTree:(SearchTree)tree
{
    return NULL;
}
#endif
@end
