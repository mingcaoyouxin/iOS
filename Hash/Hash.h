//
//  Hash.h
//  Algorithm
//  散列函数的选择：散列表的大小一般要位素数，因为简单地直接可以用Key mod TableSize来作为散列函数
//  例如下面一种情况，关键字是字符串，如何选择散列函数？
//  1、选择字符串的ASCII码值相加 mod TableSize 作为散列函数。存在问题：tableSize如果很大假设为10007（素数），字符串长度至多8个字符，ASCII码值最大和为8*127 = 1016，那么会造成分配不均匀
//  2、程序Horner法则
//
//
//  Created by 浩 董 on 15/8/31.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#ifndef Algorithm_Hash_h
#define Algorithm_Hash_h


#endif
