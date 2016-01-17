//
//  DoorWithLock.m
//  Algorithm
//
//  Created by 浩 董 on 15/8/17.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import "DoorWithLock.h"
#import "Help.h"

@implementation DoorWithLock

/**
 *问题描述：
 *在走廊上有n个带锁的门，从1到n一次编号。最初所有的门都是关着的。我们从门前一次经过n此，每一次都从1号门开始。
 *在第i次经过时（i = 1，2．．．n）我们改变i的整数倍号锁的状态：也就是如果们是关着的，就打开它；如果门是打开的，就关上它。
 *举例来说，第一次经过之后，所有的门都是打开的；
 *第二次经过时，我们只改变偶数门得状态（2号门，4号门．．．．．．）这样一来，第二次经过之后，偶数门是关着的，而奇数门是开着的；
 *第三次经过时，我们把3号门关上（该门在第一次经过时被打开），打开6号门（该门在第二次经过时被关上），
 *以此类推。在最后以此经过后，那些门是打开的？那些门是关上的？有多少打开的门？
 *
 *解决方案：
 *如果一个数是完全平方数，那么这个数将会有奇数个因子，因此门会改变奇数次，因为初始为关着的，因此最后将是开着的
 *如果一个数是非完全平方数，那么这个数将会有偶数个因子，因此门会改变偶数次，因为初始是关着的，最后改门则是关着的
 */

+(NSArray *)doorsWithLockWithDoorNumber:(int) doorNumber
{
    if (doorNumber <= 0) {
        return NULL;
    }
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 0; i <= doorNumber; i++) {
        [array addObject:[NSNumber numberWithInteger:0]];
    }
    
//    for(int i = 1; i <= doorNumber; i++){
//        if ([Help isPerfectSqure:i]) {
//            array[i] = [NSNumber numberWithInteger:1];
//        }else{
//            array[i] = [NSNumber numberWithInteger:0];
//        }
//    }
    for (int i = 1; i * i <= doorNumber; i++) {
        array [i * i] = [NSNumber numberWithInteger:1];
    }
    return array;
}
@end
