//
//  DFBankAccount.m
//  my_finances
//
//  Created by Dahiri Farid on 8/30/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#import "DFBankAccount.h"

@interface DFBankAccount ()

@property (nonatomic, strong, readwrite) NSNumber* balance;

@end

@implementation DFBankAccount

- (void)updateBalance:(NSNumber*)aBalence
{
    NSParameterAssert(aBalence);
    self.balance = aBalence;
}

@end
