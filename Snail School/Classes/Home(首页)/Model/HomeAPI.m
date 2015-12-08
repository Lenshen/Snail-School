//
//  HomeAPI.m
//  Snail School
//
//  Created by 远深 on 15/12/2.
//  Copyright © 2015年 himooo. All rights reserved.
//

#import "HomeAPI.h"
#import "MJPhotoBrowser.h"


@implementation HomeAPI
+(void)homeDataWithUrl:(NSString *)urlString
       success:(void(^)(id homeData))success
               fail:(void (^)())fail
{
    
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
     manger.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manger GET:urlString parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *json = [HomeModel arrayOfModelsFromDictionaries:responseObject error:nil];
        if (success) {
            success(json);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"获取信息失败，请稍后再试" message:nil delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil];
        [alert show];
    }];
    
}
+(void)huatiDataWithUrl:(NSString *)urlString
                success:(void(^)(id homeData))success
                   fail:(void(^)())fail
{
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    manger.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manger GET:urlString parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *json = [huaTiJsonModel arrayOfModelsFromDictionaries:responseObject error:nil];
        if (success) {
            success(json);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"获取信息失败，请稍后再试" message:nil delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil];
        [alert show];
    }];

}
+(void)homeDataWithUrl:(NSString *)urlString
                 Image:(UIImage *)image
                button:(UIButton *)button

{
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        NSURL *url = [NSURL URLWithString:urlString];

        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *img = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            [button setImage:img forState:UIControlStateNormal];
        });
        
    });
}
+(void)homeDataWithUrl:(NSArray *)urlString
             mutoArray:(NSMutableArray *)imageArray

{
    NSMutableArray *array= [[NSMutableArray alloc]init];

    for (int i = 0; i < urlString.count; i++) {
        dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
        dispatch_async(queue, ^{
            NSURL *url = [[NSURL alloc]init];
            NSString *str = [NSString stringWithFormat:@"http://139.196.33.40/%@",urlString[i]];
            url  = [NSURL URLWithString:str];
            NSData *data = [[NSData alloc]init];
            data = [NSData dataWithContentsOfURL:url];
            UIImage *img = [UIImage imageWithData:data];
            dispatch_async(dispatch_get_main_queue(), ^{
            });
            [array addObject:img];
            [imageArray addObject:array[0]];
        });
  
    }
    
}
+(void)homeDataWithjsonModel:(NSArray *)jsonModelImg
             imageView:(UIImageView *)cellImageView
            Scrollview:(UIScrollView *)scrollview

{


    NSMutableArray *urlArray = [[NSMutableArray alloc]init];


    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        UIImageView *imgview = [[UIImageView alloc]init];

        UIImageView *imgview2 = [[UIImageView alloc]init];
        UIImage *image = [[UIImage alloc]init];

    for(int i=0; i< jsonModelImg.count; i++)
    {
        NSString *str = [NSString stringWithFormat:@"http://139.196.33.40/%@",jsonModelImg[i]];
        NSURL *url = [NSURL URLWithString:str];
 
        [imgview sd_setImageWithURL:url];
        [urlArray addObject:imgview];
        cellImageView.frame = CGRectMake(scrollview.frame.size.width*i,0,scrollview.frame.size.width,200);
        imgview2 = urlArray[i];
        
     
    }
        dispatch_async(dispatch_get_main_queue(), ^{
            cellImageView.image = imgview2.image;
            [scrollview addSubview:imgview2];
            
        });
   });

}
+(UIImage *)imageWithJsonString:(NSString *)jsonString
{
    NSString *str1 = @"http://139.196.33.40/";
    NSString *str = [NSString stringWithFormat:@"%@%@",str1,jsonString];
    NSURL *url  = [NSURL URLWithString:str];
    
    
    NSData *resultData = [NSData dataWithContentsOfURL:url];
    UIImage *img = [UIImage imageWithData:resultData];
    return img;
}
@end
