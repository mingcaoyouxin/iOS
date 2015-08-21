//
//  Sieve.m
//  Algorithm
//
//  Created by 浩 董 on 15/8/13.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import "Prime.h"

@implementation Prime


/**
 *埃拉托色尼筛
 *算法思想，依次排除2、3、4、5...的倍数
 *算法终止：根号n。
    因为如果一个数n不是质数，则必是2或3或4或5...或根号n的倍数，不用从2、3...n的倍数来判断，因为如果一个数可以因数分解那么必定一个因数大于根号n，一个小于根号n
 *优化：
    2的倍数6也是3的倍数，因此多次判断。这部分可以优化，对于p的倍数，从p*p开始排除，因为p*2，p*3,...,p*p-1肯定都是被判断过的
    如果一个数是前面某个数的倍数，那么这个数的倍数就不用排除了，如4是2的倍数，那么4的倍数就不用排除了
 */

-(NSArray *)sequentPrimeNumberInNumber:(NSInteger)num
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i <= num; i++) {
        [array addObject:[NSNumber numberWithInteger:1]];
    }
    for (int i = 2; i <= sqrt(num); i++) {
        if (array[i] != 0){//不在排除已经是前面某个数的倍数的数的倍数
            int temp = i * i;//p*p开始判断
            while(temp <= num){
                array[temp] = [NSNumber numberWithInt:0];
                temp += i;
            }
        }
        
    }
    return  array;
}




@end
