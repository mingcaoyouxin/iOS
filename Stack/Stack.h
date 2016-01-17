//
//  Stack.h
//  Algorithm
//
//  Created by 浩 董 on 15/9/21.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

struct StackRecord;
typedef int ElementType;
typedef struct StackRecord* stack;

@interface Stack : NSObject

#ifndef _Stack_h
#define _Stack_h

//判断栈是否为空
- (int) isEmpty:(stack)S;

//判断栈是否已满
- (int) isFull:(stack)S;

//创建栈
- (stack) createStack:(int)maxElement;

//释放栈
- (void) disposeStack: (stack)s;

//使栈为空
- (void) makeEmpty:(stack)s;

//入栈
- (void) push:(ElementType)x stack:(stack)s;

//获取站定元素
- (ElementType)top:(stack)s;

//出栈
- (void) pop:(stack)s;

//出栈并返回站定元素
- (ElementType)topAndPop:(stack)s;

#endif

@end
