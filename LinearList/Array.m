//
//  Array.m
//  Algorithm
//
//  Created by 浩 董 on 15/8/31.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import "Array.h"

@implementation Array

/*Given a sorted array, remove the duplicates in place such that each element appear only once and return the new length.
 Do not allocate extra space for another array, you must do this in place with constant memory.
 For example, Given input array A = [1,1,2],
 Your function should return length = 2, and A is now [1,2].
 */
//删除已排序数组中重复的元素，要求时间复杂度O(n)空间复杂度O(1)
/*算法思路：
 * 有点类似快排的方法，两个指针，一个指针i是循环遍历，另一个指针index是存放不重复的元素
 */
-(int)removeDuplicates:(int *)A  length:(int)length
{
    if(length == 0){
        return 0;
    }
    int index = 0;
    for (int i = 1; i < length; i++) {
        if (A[index] != A[i]) {
            A[++index] = A[i];
        }
    }
    return index + 1;
}

/*Follow up for ”Remove Duplicates”: What if duplicates are allowed at most twice? For example, Given sorted array A = [1,1,1,2,2,3],
 Your function should return length = 5, and A is now [1,1,2,2,3]
 */
/*算法思路：
 *
 */
-(int)removeMoreThanTwiceDuplicates:(int *)A length:(int)length
{
    if (length <= 2) {
        return length;
    }
    int index = 2;
    for (int i = 2; i < length; i++) {
        if (A[index] != A[i-2]) {
            A[index++] = A[i];
        }
    }
    return index + 1;
}

/*Suppose a sorted array is rotated at some pivot unknown to you beforehand.
 (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
 You are given a target value to search. If found in the array return its index, otherwise return -1. You may assume no duplicate exists in the array.
 */
-(int)searchInArray:(int *)A length:(int)length target:(int)target
{
    int left = 0,right = length - 1;
    while (left != right) {
        int mid = (left + right ) / 2;
        if (A[mid] == target) {
            return mid;
        }
        //如果第一个数比中间的数小，说明pivot（轴点,数组的最小值）应该在mid的右侧 例如序列 4 5 6 7 0 1 2 A[mid]为7 而轴点是0
        if (A[left] <= A[mid]) {
            //这种情况下保证的是left...mid的数为增序,如这里的 4 5 6 7
            if(A[left] <= target && target < A[mid]){
                right = mid;
            }else{
                left = mid + 1;
            }
        }else{
            //如果第一个数比中间的数大，说明pivot在mid的左侧或者在mid处，例如序列  5 6 0 1 2 3 4 A[mid]为 1 而轴点是0
            //这种情况下保证的时mid...right为降序，如这里的 1,2,3,4 因此判断target是否在该区间内
            if(A[mid] < target && target <= A[right]){
                left = mid + 1;
            }else{
                right = mid;
            }
        }
    }
    return -1;
}

/*Follow up for ”Search in Rotated Sorted Array”: What if duplicates are allowed? Would this affect the run-time complexity? How and why?
Write a function to determine if a given target is in the array.*/
-(int)searchInDuplicatedArray:(int *)A length:(int)length target:(int)target
{
    //这道题与上面那道题的区别在于A[mid]可能等于A[left] 例如 1 3 1 1 1 这里A[mid] = 1 == A[left]这时不能保证left ... mid 为增序 这种情况直接left++ 就可以了
    int left = 0,right = length - 1;
    while (left != right) {
        int mid = (left + right ) / 2;
        if (A[mid] == target) {
            return mid;
        }
        //如果第一个数比中间的数小，说明pivot（轴点,数组的最小值）应该在mid的右侧 例如序列 4 5 6 7 0 1 2 A[mid]为7 而轴点是0
        if (A[left] < A[mid]) {
            //这种情况下保证的是left...mid的数为增序,如这里的 4 5 6 7
            if(A[left] <= target && target < A[mid]){
                right = mid;
            }else{
                left = mid + 1;
            }
        }else if (A[left] > A[mid]){
            //如果第一个数比中间的数大，说明pivot在mid的左侧或者在mid处，例如序列  5 6 0 1 2 3 4 A[mid]为 1 而轴点是0
            //这种情况下保证的时mid...right为降序，如这里的 1,2,3,4 因此判断target是否在该区间内
            if(A[mid] < target && target <= A[right]){
                left = mid + 1;
            }else{
                right = mid;
            }
        }else{
            //第三种情况也就是A[mid] == A[left] 因为不能保证 left ... mid 为递增序列 这里A[left]不可能是target 因为mid == left A[mid] != target 所以直接left++,考虑序列 left+1 ... right
            left++;
        }
    }

    return -1;
}
/*There are two sorted arrays A and B of size m and n respectively. Find the median of the two sorted arrays. The overall run time complexity should be O(log(m + n)).
 */

/*算法思路一：
 * 可以用一个计数器, 记录当前已经找到第 m 大的元素了。同时我们使用两个指针 pA 和 pB,分别指向 A 和 B 数组的第一个元素,
 * 使用类似于 merge sort 的原理,如果数组 A 当前元素小,那么 pA++,同时 m++;如果 数组 B 当前元素小,那么 pB++,同时 m++。
 * 最终当 m 等于 k 的时候,就得到了我们的答案,O(k) 时间,O(1) 空间。但是,当 k 很接近 m + n 的时候,这个方法还是 O(m + n) 的。
 */

/*算法思路二、
 * 有没有更好的方案呢？我们可以考虑从k入手。如果我们每次都能够删除一个一定在第k大元素之前的元素,那么我们需要进行k次。但是如果每次我们都删除一半呢?由于A和B都是有序的,我们应该充分利用这里面的信息,类似于二分查找,也是充分利用了“有序”。
 * 假设A和B的元素个数都大于k/2,我们将A的第k/2个元素(即 A[k/2-1])和 B 的第 k/2 个元素(即 B[k/2-1])进行比较,
 * 有以下三种情况(为了简化这里先假设 k 为偶数,所得到的结论对于k是奇数也是成立的):
 》 A[k/2-1] == B[k/2-1] 
 》 A[k/2-1] > B[k/2-1] 
 》 A[k/2-1] < B[k/2-1]
 * 如果 A[k/2-1] < B[k/2-1],意味着A[0]到A[k/2-1]的肯定在 A ∪ B 的top k 元素的范围内,换句话说,A[k/2-1]不可能大于 A ∪ B 的第k大元素。留给读者证明。因此,我们可以放心的删除A数组的这k/2个元素。
 * 同理,当 A[k/2-1] > B[k/2-1] 时,可以删除 B 数组的 k/2 个元素。
 * 当 A[k/2-1] == B[k/2-1] 时,说明找到了第 k 大的元素,直接返回 A[k/2-1] 或 B[k/2-1] 即可。
 * 因此,我们可以写一个递归函数。那么函数什么时候应该终止呢?
 》当A或B是空时,直接返回B[k-1]或A[k-1];
 》当k=1是,返回min(A[0],B[0]);
 》当A[k/2-1]==B[k/2-1]时,返回A[k/2-1]或B[k/2-1]
 */

-(double)findMedianSortedArraysOfFirstArray:(int *)A firstLength:(int) m secondArray:(int *)B secondeLength:(int)n{
#ifdef findMeadianSortedArrays_NotBetter
    int i = 0,j = 0;
    int mid = (m + n) / 2;//指定中位数的位置
    int count = -1;//计数器用于记录当前已经找到第几大的数字
    int temp = -2;//临时变量用于存储该数在A或B中的位置。这里初始化为-2，因为假设不进入循环时，直接在最后判断可能溢出
    while (i < m || j < n) {
        if (i < m && A[i] <= B[j]) {
            temp = i;
            i++;
        }else{
            temp = j;
            j++;
        }
        count ++;
        if (count == mid) {
            break;
        }
    }
    //如果temp是i-1,说明最后一步执行的是i++，那么这个中位数应该在A中，反之在B中。
    if (temp == i - 1) {
        return A[temp];
    }else if(temp == j -1){
        return B[temp];
    }else{
        return -1;
    }
#endif
    int total = m + n;
    //如果总数是个奇数
    if (total & 0x1) {
    //
        return [self find_kthOfFirstArray:A firstLength:m secondArray:B secondeLength:n kth:total / 2 + 1];
    }else{
        //如果是个偶数，则返回两个中间数的平均值
        return ([self find_kthOfFirstArray:A firstLength:m secondArray:B secondeLength:n kth:total / 2] + [self find_kthOfFirstArray:A firstLength:m secondArray:B secondeLength:n kth:total / 2 + 1] ) / 2;
    }
}

//找到两个数组合并后的第k大的数，注意并没有第0大这一说法
-(double)find_kthOfFirstArray:(int *)A firstLength:(int) m secondArray:(int *)B secondeLength:(int)n kth:(int)k
{
    //我们假设m <= n ，如果m > n则将两个参数对调
    if (m > n) {
        [self find_kthOfFirstArray:B firstLength:n secondArray:A secondeLength:m kth:k];
    }
    //如果m == 0，说明A中无元素，可以直接返回B[k-1]
    if (m == 0) {
        return B[k-1];
    }
    //如果要找第一大的元素，则直接可以返回A[0] B[0]两者之间的最小者
    if(k == 1){
        return  MIN(A[0], B[0]);
    }
    //两个指针，第一个指针指向k/2或m的最小值，因为m始终小于n，所以不用对n做特殊判断
    int pa = MIN(k / 2, m), pb = k - pa;
    
    if (A[pa - 1] == B[pb - 1]) {
        return A[pa - 1];
    }else if(A[pa - 1] < B[pb - 1]){
        return [self find_kthOfFirstArray:(A+pa) firstLength:m-pa secondArray:B secondeLength:n kth:k-pa];
    }else{
        return [self find_kthOfFirstArray:A firstLength:m secondArray:B+pb secondeLength:n-pb kth:k-pb];
    }
}
/*
 Given an unsorted array of integers, find the length of the longest consecutive elements sequence.
 For example, Given [100, 4, 200, 1, 3, 2], The longest consecutive elements sequence is [1, 2, 3, 4]. Return its length: 4.
 Your algorithm should run in O(n) complexity.
 */
/*
 算法思路一：
 若是时间复杂度无要求，可以通过先排序的方法，时间复杂度为O(logn)但是这里对时间复杂度有要求，因此可以通过hash表来实现
 */
-(int)longestConsecutiveOfArray:(int *)A length:(int)length
{
    /*
    由于在object-c 中并没有hashmap，虽然有NSDictionary，但是为了某些个人需要，这里用java语言实现算法
    if (nums.length == 0){
        return 0;
    }
    HashMap<Integer,Boolean> map = new HashMap<Integer, Boolean>();
     //用一个哈希表 map 记录每个元素是否使用,对每个元素,以该元素为中心,往左右扩张,直到不连续为止,记录下最长的长度。初始时候，每个元素都是未使用过的
    for (int num : nums){
        map.put((Integer)num, false);
    }
    int longest = 0;
    for(int num : nums){
        //如果使用过则继续下一个数
        if (map.get((Integer)num) == true)
            continue;
        int length = 1;
        map.put(num,true);
        for (int right = num + 1; map.containsKey((Integer)right) && right < map.size();right ++){
            length++;
            map.put((Integer)right,true);
        }
        for (int left = num - 1; map.containsKey((Integer)left) && left >= 0 ; left --){
            length++;
            map.put((Integer)left,true);
        }
        longest = Math.max(length,longest);
    }
    return longest;
    */
    return 0;
     
}

@end
