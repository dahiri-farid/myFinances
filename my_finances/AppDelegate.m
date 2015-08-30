//
//  AppDelegate.m
//  my_finances
//
//  Created by Dahiri Farid on 8/30/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#import "AppDelegate.h"
#import "DFTabBarNavigationController.h"
#import "DFBankAccountViewController.h"
#import "DFIncomesViewController.h"
#import "DFExpensesViewController.h"
#import "DFReportsViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong)   UITabBarController* tabBarController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.tabBarController = UITabBarController.new;
    
    DFBankAccountViewController* bankAccountVC = DFBankAccountViewController.vc;
    DFIncomesViewController* incomesVC     = DFIncomesViewController.vc;
    DFExpensesViewController* expensesVC    = DFExpensesViewController.vc;
    DFReportsViewController* reportsVC     = DFReportsViewController.vc;
    
    DFTabBarNavigationController* bankAccountNC = [DFTabBarNavigationController tabBarNavigationControllerWithStyle:DFTabBarNavigationControllerBankAccount];
    DFTabBarNavigationController* incomesNC = [DFTabBarNavigationController tabBarNavigationControllerWithStyle:DFTabBarNavigationControllerIncomes];
    DFTabBarNavigationController* expensesNC = [DFTabBarNavigationController tabBarNavigationControllerWithStyle:DFTabBarNavigationControllerExpenses];
    DFTabBarNavigationController* reportsNC = [DFTabBarNavigationController tabBarNavigationControllerWithStyle:DFTabBarNavigationControllerReports];
    
    bankAccountNC.viewControllers = @[bankAccountVC];
    incomesNC.viewControllers = @[incomesVC];
    expensesNC.viewControllers = @[expensesVC];
    reportsNC.viewControllers = @[reportsVC];
    
    self.tabBarController.viewControllers = @[bankAccountNC, incomesNC, expensesNC, reportsNC];
    
    self.window = [UIWindow.alloc initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    
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
