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
#import <MagicalRecord/MagicalRecord.h>

@implementation DFDataManager

DF_DEPLOY_SINGLETON(DFDataManager)

- (instancetype)init
{
    self = super.init;
    if (self)
    {
//        [MagicalRecord setupCoreDataStackWithStoreNamed:@"my_finances_coredata_store.sqlite"];
        [MagicalRecord setupAutoMigratingCoreDataStack];
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

- (void)cleapUp
{
    [MagicalRecord cleanUp];
}

@end
