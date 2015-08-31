//
//  MinDistance.h
//  Algorithm
//
//  Created by 浩 董 on 15/8/18.
//  Copyright (c) 2015年 com.tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MinDistance : NSObject

//求数值数组中大小最接近的两个元素的差
-(NSInteger)minDistanceOfArray:(NSInteger *)array withBegin:(NSInteger)p withEnd:(NSInteger)r;
@end
