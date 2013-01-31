//
//  AppDelegate.m
//  SPEA
//
//  Created by Marco Battisti on 18/01/13.
//  Copyright (c) 2013 Icarus. All rights reserved.
//

#import "AppDelegate.h"
#import "SPEAViewController.h"
#import "MenuViewController.h"

@implementation AppDelegate

- (void)dealloc
{
    [tabBarController release];
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    
    NSMutableArray *aControllers=[[NSMutableArray alloc] initWithCapacity:3];
    tabBarController = [[UITabBarController alloc]init];
    
    /*MenuViewController *rMenuViewController = [[MenuViewController alloc]initWithNibName:nil bundle:nil];*/
    MenuViewController *rMenuViewController = [[MenuViewController alloc] initWithName:@"Prodotti" pID:0];
    rMenuViewController.title = @"Prodotti";
    rMenuViewController.tabBarItem.image = [UIImage imageNamed:@"settings.png"];
    
    UINavigationController *rMenuNavController = [[UINavigationController alloc] initWithRootViewController: rMenuViewController];
    
    SPEAViewController *rSPEAViewController = [[SPEAViewController alloc]initWithNibName:nil bundle:nil];
    rSPEAViewController.title = @"SPEA";
    rSPEAViewController.tabBarItem.image = [UIImage imageNamed:@"settings.png"];
    
    SPEAViewController *rSPEAViewController2 = [[SPEAViewController alloc]initWithNibName:nil bundle:nil];
    rSPEAViewController2.title = @"Settings";
    rSPEAViewController2.tabBarItem.image = [UIImage imageNamed:@"settings.png"];
    
    [aControllers addObject:rMenuNavController];
    [aControllers addObject:rSPEAViewController];
    [aControllers addObject:rSPEAViewController2];
    
    tabBarController.viewControllers = aControllers;   
    
    [rSPEAViewController release];
    [rMenuViewController release];
    
    [self.window addSubview:tabBarController.view];
    
    [self.window setRootViewController:tabBarController];
    
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
