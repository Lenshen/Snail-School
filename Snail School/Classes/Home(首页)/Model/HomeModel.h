//
//  HomeModel.h
//  Snail School
//
//  Created by 远深 on 15/11/30.
//  Copyright © 2015年 himooo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

//@protocol HomeimageModel
//
//@end

@interface HomeimageModel : JSONModel
@property (nonatomic, strong)NSString* image1;


@end


@interface HomeModel : JSONModel
//typedef NS_ENUM(NSInteger,SecondHandType)
//{
//    SecondHandSaleType,
//    SecondHandRentType,
//    SecondHandBarterType,
//};
@property (assign, nonatomic) int good_id;
@property (strong, nonatomic) NSString* good_name;
@property (strong, nonatomic) NSString* good_desc;
@property (strong, nonatomic) NSString* good_time;
@property (strong, nonatomic) NSString* trader_icon;
@property (assign, nonatomic) int trader_isAuth;
@property (strong, nonatomic) NSString* trader_account;
@property (strong, nonatomic) NSString* trader_university;
@property (assign, nonatomic) int trader_sex;

@property (strong, nonatomic) NSArray* img;

//@property (assign, nonatomic) BOOL isInEurope;

//@property (nonatomic,assign) NSInteger SecondHandType;

+(HomeModel *)shareManger;

@end
