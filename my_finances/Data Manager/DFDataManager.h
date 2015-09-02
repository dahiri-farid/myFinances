//
//  DFDataManager.h
//  my_finances
//
//  Created by Dahiri Farid on 8/30/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DFMacroUtils.h"

@class DFBankAccount;
@class DFIncome;
@class DFExpense;

@interface DFDataManager : NSObject

DF_DECLARE_SINGLETON

- (DFBankAccount*)bankAccount;
- (void)saveBankAccount:(DFBankAccount *)aBankAccount;
- (NSArray*)incomes;
- (NSArray*)expenses;
- (void)addIncome:(DFIncome*)aIncome;
- (void)addExpense:(DFExpense*)aExpense;


- (void)cleapUp;

@end
