//
//  AppDelegate.m
//  Snail School
//
//  Created by 远深 on 15/11/7.
//  Copyright © 2015年 himooo. All rights reserved.
//

#import "AppDelegate.h"
#import "XQNewFeatureVC.h"
#import "HomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    [self newFeature];

    return YES;
}
-(void)newFeature
{
    NSString *version =[NSKeyedUnarchiver unarchiveObjectWithFile:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"version.data"]];
    // app当前版本
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = [infoDict objectForKey:@"CFBundleShortVersionString"];
    
    if ([currentVersion isEqualToString:version]) {
        
        self.window.rootViewController = [[HomeViewController alloc] init];
    }else{
        
        XQNewFeatureVC *newVc = [[XQNewFeatureVC alloc] initWithFeatureImagesNameArray:@[@"1",@"2",@"3",@"4"]];
     
        newVc.pageIndicatorTintColor = [UIColor clearColor];
        self.window.rootViewController = newVc;
        newVc.completeBlock = ^{
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UITabBarController *tab = [storyboard instantiateViewControllerWithIdentifier:@"tab"];
            self.window.rootViewController = tab;
            

        };
        
        [self.window makeKeyAndVisible];

    }
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
