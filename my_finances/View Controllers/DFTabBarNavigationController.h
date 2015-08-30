//
//  DFTabBarNavigationController.h
//  my_finances
//
//  Created by Dahiri Farid on 8/30/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DFTabBarNavigationControllerStyle)
{
    DFTabBarNavigationControllerBankAccount,
    DFTabBarNavigationControllerIncomes,
    DFTabBarNavigationControllerExpenses,
    DFTabBarNavigationControllerReports,
};

@interface DFTabBarNavigationController : UINavigationController

@property (nonatomic, assign, readonly) DFTabBarNavigationControllerStyle controllerStyle;

+ (instancetype)tabBarNavigationControllerWithStyle:(DFTabBarNavigationControllerStyle)aStyle;

@end
