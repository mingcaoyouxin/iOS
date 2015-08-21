//
//  Help.h
//  GCD
//
//  Created by 浩 董 on 15/8/13.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Help : NSObject

//判断一个数是否是完全平方数
+(BOOL)isPerfectSqure:(NSInteger) number;
//求数组元素的长度
+(NSInteger)lengthOfArray:(NSInteger *)array;
//求三个数的最大值
+(NSInteger) maxOfFirst:(NSInteger)A second:(NSInteger)B third:(NSInteger)C;
//求三个数的最小值
+(NSInteger) minOfFirst:(NSInteger)A second:(NSInteger)B third:(NSInteger)C;
@end
