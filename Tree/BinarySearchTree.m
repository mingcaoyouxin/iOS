//
//  BinarySearchTree.m
//  Algorithm
//
//  Created by 浩 董 on 15/8/21.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import "BinarySearchTree.h"

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
        PtrToNode right = [self insertElement:element inTree:tree->right];
        right->parent = tree;
        tree->right = right;
        //如果是结构体未定义父指针
        //tree->right = [self insertElement:element inTree:tree->right];
    }else{
        PtrToNode left = [self insertElement:element inTree:tree->left];
        left->parent = tree;
        tree->left = left;
        //如果是结构体未定义父指针
        //tree->left = [self insertElement:element inTree:tree->left];
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

//插入思想，沿树下降，根据element与key[x]的大小比较来决定向左转或向右转，直到x为空为止
-(SearchTree)insertElement:(ElementType)element inTree:(SearchTree)tree
{
    PtrToNode y = NULL;
    PtrToNode x = tree;
    while (x != NULL) {
        y = x;//这一步是为了保存父节点
        if (element < x->element) {
            x = x->left;
        }else{
            x = x ->right;
        }
    }
    //跳出循环时 x为null y为x的父节点
    PtrToNode new = malloc(sizeof(struct TreeNode));
    if (new == NULL) {
        NSLog(@"out of space!");
        return 0;
    }
    //添加new结点 并且他的父亲为y
    new->element = element;
    new->left = NULL;
    new->right = NULL;
    new->parent = y;
    
    //如果y为空，则说明树原本为空，因此树的根结点便是new
    if (y == NULL) {
        tree = new;
    }else if(element < y->element){
        y->left = new;
    }else{
        y->right = new;
    }
    return tree;
}
#endif

//删除结点z的情况有些特殊：分三种情况：
//如果z没有子女，则修改该其父结点p[z]，使NIL为其子女
//如果z只有一个子女，则可以通过在其子节点与父节点间建立一条链来删除z
//如果z有两个子女，先删除z的后继y（他没有左子女），再用y的内容来代替z的内容
//综上，前两种情况删除的都是结点z，最后一种情况删除的时结点z的后继y
-(SearchTree)deleteElement:(ElementType)element inTree:(SearchTree)tree
{
    //首先找到要删除的结点
    if (tree == NULL) {
        return 0;
    }
    //首先找到该结点
    struct TreeNode *z = [self findElement:element inTree:tree];
    if (z == NULL) {
        return NULL;
    }
    //这里假设统一删除结点y，且三种情况y都至多只有一个子女
    struct TreeNode *y,*x;
    //如果有一个孩子为空，或者没有子女，则y=z
    if(z->left == NULL || z->right == NULL){
        y = z;
    }else{
        y = [self successorOfElement:element inTree:tree];//如果有两个子女，则y=z的后继
    }
    
    //删除结点y,首先找到它的孩子
    if(y->left){
        x = y->left;
    }else{
        x = y->right;
    }
    //这里的x可能为空，因为对于情况一、结点z（y）是没有子女的
    if(x != NULL){
        //使y的孩子x的父指针指向y的父节点
        x->parent = y->parent;
    }
    
    //下面是将y的父亲的左指针或右指针指向x
    
    //如果y是根结点，那么就将它的孩子x作为新的根结点
    if(y->parent == NULL){
        tree = x;
    }else if(y == y->parent->left){
        //如果y是他父亲的左孩子,则父亲的左指针指向x
        y->parent->left = x;
    }else{
        y->parent->right = x;
    }
    
    //如果是情况三还需要将y结点的值赋给z结点
    if (y != z) {
        z->element = y->element;
    }
    return tree;
}

-(void)printTree:(SearchTree)tree
{
    if (tree != NULL) {
        [self printTree:tree->left];
        printf("%ld  ",tree->element);
        [self printTree:tree->right];
    }
}


//给定一个二叉查找树中的结点，要求找出在中序遍历顺序下它的后继。如果所有的关键字均不相同，则某一结点x的后继即具有大于key[x]的关键字中最小者的那个结点。如果结点x的右子树为空，且x有一个后继y，则y是x的最低祖先结点，且y的左儿子也是x的祖先
-(Position)successorOfElement:(ElementType)element inTree:(SearchTree)tree
{
    //首先找到该结点
    struct TreeNode *node = [self findElement:element inTree:tree];
    if (node == NULL) {
        return NULL;
    }
    struct TreeNode *y;
    if (node->right != NULL) {
        return [self findMinInTree:node->right];
    }
    y = node->parent;
    while (y != NULL && y->right == node) {
        node = y;
        y = node->parent;
    }
    return y;
}


@end
