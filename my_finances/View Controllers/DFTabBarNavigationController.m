//
//  DFTabBarNavigationController.m
//  my_finances
//
//  Created by Dahiri Farid on 8/30/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#import "DFTabBarNavigationController.h"

@interface DFTabBarNavigationController ()

@property (nonatomic, assign, readwrite) DFTabBarNavigationControllerStyle controllerStyle;

@end

@implementation DFTabBarNavigationController

+ (instancetype)tabBarNavigationControllerWithStyle:(DFTabBarNavigationControllerStyle)aStyle
{
    return [[self alloc] initWithControllerStyle:aStyle];
}

- (instancetype)initWithControllerStyle:(DFTabBarNavigationControllerStyle)aStyle
{
    self = super.init;
    if (self)
    {
        self.controllerStyle = aStyle;
        
        switch (self.controllerStyle)
        {
            case DFTabBarNavigationControllerBankAccount:
                self.tabBarItem = [UITabBarItem.alloc initWithTabBarSystemItem:UITabBarSystemItemContacts
                                                                           tag:1];
                break;
            case DFTabBarNavigationControllerIncomes:
                self.tabBarItem = [UITabBarItem.alloc initWithTabBarSystemItem:UITabBarSystemItemMore
                                                                           tag:1];
                
                break;
            case DFTabBarNavigationControllerExpenses:
                self.tabBarItem = [UITabBarItem.alloc initWithTabBarSystemItem:UITabBarSystemItemTopRated
                                                                           tag:1];
                
                break;
            case DFTabBarNavigationControllerReports:
                self.tabBarItem = [UITabBarItem.alloc initWithTabBarSystemItem:UITabBarSystemItemHistory
                                                                           tag:1];
                break;
            default:
                NSAssert(NO, @"Not implemented!");
                break;
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
