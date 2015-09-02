//
//  DFDataManager.m
//  my_finances
//
//  Created by Dahiri Farid on 8/30/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#import "DFDataManager.h"
#import "DFCDBankAccount.h"
#import "DFBankAccount.h"
#import "DFIncome.h"
#import "DFExpense.h"
#import "DFCDIncome.h"
#import "DFCDExpense.h"
#import <MagicalRecord/MagicalRecord.h>

@implementation DFDataManager

DF_DEPLOY_SINGLETON(DFDataManager)

- (instancetype)init
{
    self = super.init;
    if (self)
    {
        [MagicalRecord setupCoreDataStackWithStoreNamed:@"my_finances_coredata_store.sqlite"];
    }
    return self;
}

- (DFBankAccount*)bankAccount
{
    DFCDBankAccount* cdBankAccount = self.cdBankAccount;
   
    DFBankAccount* plainBackAccount = DFBankAccount.new;
    
    [plainBackAccount updateBalance:cdBankAccount.balance];
    
    return plainBackAccount;
}

- (DFCDBankAccount *)cdBankAccount
{
    NSArray* accounts = [DFCDBankAccount MR_findAll];
    DFCDBankAccount* account = nil;
    NSParameterAssert(accounts.count < 2);
    if (accounts.count == 0)
    {
        account = [DFCDBankAccount MR_createEntity];
    }
    else
    {
        account = accounts.firstObject;
    }
    return account;
}

- (void)saveBankAccount:(DFBankAccount *)aBankAccount
{
    NSParameterAssert(aBankAccount);
    __weak typeof (self)weakSelf = self;
    [self.cdBankAccount.managedObjectContext
     MR_saveWithBlockAndWait:^(NSManagedObjectContext *localContext)
     {
         weakSelf.cdBankAccount.balance = aBankAccount.balance;
    }];

    [self.cdBankAccount.managedObjectContext MR_saveToPersistentStoreAndWait];
}

- (NSArray*)incomes
{
    NSMutableArray* modelIncomes = NSMutableArray.array;
    NSArray* cdIncomes = [DFCDIncome MR_findAll];
    
    for (DFCDIncome* cdIncome in cdIncomes)
    {
        DFIncome* income = DFIncome.new;
        income.type = cdIncome.type;
        income.amount = cdIncome.amount;
        
        [modelIncomes addObject:income];
    }
    
    return modelIncomes;
}

- (NSArray*)expenses
{
    NSMutableArray* modelExpenses = NSMutableArray.array;
    NSArray* cdExpenses = [DFCDExpense MR_findAll];
    
    for (DFCDExpense* cdExpense in cdExpenses)
    {
        DFExpense* expense = DFExpense.new;
        expense.type = cdExpense.type;
        expense.amount = cdExpense.amount;
        expense.recurrent = cdExpense.recurrent;
        
        [modelExpenses addObject:expense];
    }
    return modelExpenses;
}

- (void)addIncome:(DFIncome*)aIncome
{
    NSParameterAssert(aIncome);

    [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext)
    {
        DFCDIncome* cdIncome = [DFCDIncome MR_createEntity];
        cdIncome.type = aIncome.type;
        cdIncome.amount = aIncome.amount;
    }];
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

- (void)addExpense:(DFExpense*)aExpense
{
    NSParameterAssert(aExpense);

    [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext)
     {
         DFCDExpense* cdExpense = [DFCDExpense MR_createEntity];
         cdExpense.type = aExpense.type;
         cdExpense.amount = aExpense.amount;
     }];
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

- (void)cleapUp
{
    [MagicalRecord cleanUp];
}

@end
