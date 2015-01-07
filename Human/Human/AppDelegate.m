//
//  AppDelegate.m
//  Human
//
//  Created by Jide Opeola on 1/6/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "AppDelegate.h"
#import "Arm.h"
#import "Hand.h"
#import "Thumb.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//returnvalue-name-type(parameter) andName: type(parameter)

-(int)addNumber:(int)number1 andNumber:(int)number2 {
    
    int value = number1 + number2;
    
    return value;
    
    //nothing can run here
}

-(void)startComputer:(BOOL)started {
    
    if (started) {return; }
    //calling return will stop that method
    
    //do something to startup computer and get things ready
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // Look at again
    
//    int value = [self addNumber:3 andNumber:5];
    
    
    
    
//   leftArm.hand = [[Hand alloc] init];
    
//leftArm.hand.firstFinger = [[Finger alloc] init];
    
    Arm * leftArm = [[Arm alloc] init];
    
    leftArm.hand.firstFinger.fingerPrint = @"fingerPrint";
    
    
    Arm * rightArm = [[Arm alloc] init];
    
    
    
    
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
