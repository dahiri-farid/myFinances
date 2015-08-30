//
//  DFBankAccount.h
//  my_finances
//
//  Created by Dahiri Farid on 8/30/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DFBankAccount : NSObject

@property (nonatomic, strong, readonly) NSNumber* balance;

- (void)updateBalance:(NSNumber*)aBalence;

@end
