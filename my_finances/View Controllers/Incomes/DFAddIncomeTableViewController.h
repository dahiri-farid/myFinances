//
//  DFAddIncomeTableViewController.h
//  my_finances
//
//  Created by Dahiri Farid on 8/30/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DFAddIncomeTableViewController : UITableViewController

@property (nonatomic, copy) void (^dismissBlock)(void);

+ (instancetype)vc;

@end
