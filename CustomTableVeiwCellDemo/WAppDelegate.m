//
//  WAppDelegate.m
//  CustomTableVeiwCellDemo
//
//  Created by wzrong on 13-8-15.
//  Copyright (c) 2013年 wzrong. All rights reserved.
//

#import "WAppDelegate.h"

#import "WViewController.h"
#import <AVOSCloud/AVOSCloud.h>
#import "ECSlidingViewController.h"
#import "WMenuViewController.h"

#define AVOSCloudAppID  @"6aysjxli9vhijkpkd423x0u55u2mgware4fwpeq9gu45fiab"
#define AVOSCloudAppKey @"flwfdnhcndu2ivi6ysgh6n8xeqshpin0cq4ozmxdxaz5kwdc"

@interface WAppDelegate ()
@property (nonatomic, strong) ECSlidingViewController *slidingViewController;
@end

@implementation WAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //设置AVOSCloud
    [AVOSCloud setApplicationId:AVOSCloudAppID clientKey:AVOSCloudAppKey];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    WMenuViewController *menuController = [[WMenuViewController alloc] init];
    self.slidingViewController = [[ECSlidingViewController alloc] init];
    //通过菜单VC来获取初始VC
    self.slidingViewController.topViewController = [menuController getMenuItem:0 withSlidingVC:self.slidingViewController];
    self.slidingViewController.underLeftViewController = menuController;
    self.slidingViewController.anchorRightPeekAmount = 100.0;
    
    [self.window setRootViewController:self.slidingViewController];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
