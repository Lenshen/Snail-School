//
//  HomeModel.m
//  Snail School
//
//  Created by 远深 on 15/11/30.
//  Copyright © 2015年 himooo. All rights reserved.
//

#import "HomeModel.h"
#import "AFNetworking.h"
#define SecondHandTypeSaleUrl @"SecondHandTypeSaleUrl2"
#define SecondHandTypeRentUrl @"SecondHandTypeSaleUrl2"
#define SecondHandTypeBarterUrl @"SecondHandTypeSaleUr2"

//@implementation HomeimageModel
//
//@end
@implementation HomeModel


+(HomeModel *)shareManger
{
    __strong static HomeModel *sharedInstance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedInstance = [[HomeModel alloc] init];
    });
    
    return sharedInstance;
    
}


@end
