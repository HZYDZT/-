//
//  AppDelegate.m
//  世界辣么大
//
//  Created by dllo on 16/2/24.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "AppDelegate.h"
#import "Tabbar.h"
#import "HZYNetWorkTool.h"
#import "HZYViewController1.h"
#import "RecommendVC.h"
#import "LaunchDemo.h"
#import "UMSocial.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
     [UMSocialData setAppKey:@"56e7759fe0f55a4714002213"];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    Tabbar *root = [[Tabbar alloc] init];
    HZYViewController1 *root1 = [[HZYViewController1 alloc] init];
    self.leftSlideVC = [[LeftSlideViewController alloc] initWithLeftView:root1 andMainView:root];
    [self.leftSlideVC setPanEnabled:NO];
    self.window.rootViewController = self.leftSlideVC;
    
    LaunchDemo *demo = [[LaunchDemo alloc] init];
    [demo loadLaunchImage:@"yindao.jpg" iconName:nil appearStyle:JRApperaStyleOne bgImage:@"yindao.jpg" disappear:JRDisApperaStyleOne descriptionStr:nil];
    
    return YES;
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
