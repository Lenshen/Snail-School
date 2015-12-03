//
//  homeManager.m
//  Snail School
//
//  Created by 远深 on 15/12/2.
//  Copyright © 2015年 himooo. All rights reserved.
//

#import "homeManager.h"

@implementation homeManager
-(NSString *)requestSecondHandType
{
 
        switch (self.homeSegmentType) {
            case 0:
                return SecondHandTypeSaleUrl;
                break;
            case 1:
                return SecondHandTypeRentUrl;
                break;
            case 2:
                return SecondHandTypeBarterUrl;
            }
        return @"SecondHandTypeError";
  
}
@end
