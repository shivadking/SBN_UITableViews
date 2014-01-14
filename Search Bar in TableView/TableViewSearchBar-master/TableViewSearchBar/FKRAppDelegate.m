//
//  FKRAppDelegate.m
//  TableViewSearchBar
//
//  Created by Fabian Kreiser on 10.02.13.
//  Copyright (c) 2013 Fabian Kreiser. All rights reserved.
//

#import "FKRAppDelegate.h"
#import "FKRRootTableViewController.h"

@implementation FKRAppDelegate
@synthesize window; // From <UIApplicationDelegate>

#pragma mark - Application Lifecycle

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    FKRRootTableViewController *tableViewController = [[FKRRootTableViewController alloc] init];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:tableViewController];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}

@end