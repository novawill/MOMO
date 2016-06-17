//
//  AppDelegate.m
//  MOMO
//
//  Created by 黄梓伦 on 5/25/16.
//  Copyright © 2016 黄梓伦. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import "MusicViewController.h"
//#import "UMSocial.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
     UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[MusicViewController alloc] init]];
   LeftViewController *left = [[LeftViewController alloc] init];
    RightViewController *right = [[RightViewController alloc] init];
    RESideMenu *side = [[RESideMenu alloc] initWithContentViewController:navigationController  leftMenuViewController:left rightMenuViewController:right];
    
    side.backgroundImage = [UIImage imageNamed:@"menuBack.jpg"];
    side.menuPreferredStatusBarStyle = 1; // UIStatusBarStyleLightContent
   
    side.contentViewShadowColor = [UIColor blackColor];
    side.contentViewShadowOffset = CGSizeMake(0, 0);
    side.contentViewShadowOpacity = 0.6;
    side.contentViewShadowRadius = 12;
    side.contentViewShadowEnabled = YES;
    self.window.rootViewController = side;
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
//    [UMSocialData setAppKey:@"57625cb1e0f55a79df003722"];
    
    
    
    
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
