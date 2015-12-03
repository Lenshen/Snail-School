//
//  homeManager.h
//  Snail School
//
//  Created by 远深 on 15/12/2.
//  Copyright © 2015年 himooo. All rights reserved.
//

#import <Foundation/Foundation.h>
#define SecondHandTypeSaleUrl @"http://139.196.33.40/index.php/Good/getIndexGoods/begin/0/count/1/type/1"
#define SecondHandTypeRentUrl @"http://139.196.33.40/index.php/Good/getIndexGoods/begin/0/count/1/type/1"
#define SecondHandTypeBarterUrl @"http://139.196.33.40/index.php/Good/getIndexGoods/begin/0/count/1/type/4"
@interface homeManager : NSObject
typedef NS_ENUM(NSInteger,homeSegmentType)
{
    SecondHandSaleType,
    SecondHandRentType,
    SecondHandBarterType,
};
@property (nonatomic,assign) NSInteger homeSegmentType;

-(NSString *)requestSecondHandType;
@end
