//
//  Array.h
//  Algorithm
//
//  Created by 浩 董 on 15/8/31.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Array : NSObject
@property(nonatomic,assign) NSString *name;


//删除已排序数组中重复的元素，要求时间复杂度O(n)空间复杂度O(1)
- (int)removeDuplicates:(int *)A  length:(int)length;
//删除已排序数组中重复的元素，要求每个元素最多重复两次，时间复杂度O(n) 空间复杂度O(1)
- (int)removeMoreThanTwiceDuplicates:(int *)A length:(int)length;
//查找旋转数组中的某个元素是否存在，旋转的支点未可知，要求时间复杂度为O(lgn) 空间复杂度为O(1)
- (int)searchInArray:(int *)A length:(int)length target:(int) target;
//查找旋转数组中某个元素是否存在，旋转的支点未可知，数组中的元素可以重复，要求时间复杂度为O(lgn) 空间复杂度为O(1)
- (int)searchInDuplicatedArray:(int *)A length:(int)length target:(int)target;
//查找两个已排序数组的中位数,要求时间复杂度O(m+n)
- (double)findMedianSortedArraysOfFirstArray:(int *)A firstLength:(int)m secondArray:(int *)B secondeLength:(int)n;
//查找最长连续子序列长度,要求时间复杂度为O(n)
- (int)longestConsecutiveOfArray:(int *)A length:(int)length;
@end
