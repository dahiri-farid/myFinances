//
//  DFExpense.h
//  my_finances
//
//  Created by Dahiri Farid on 9/1/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DFExpense : NSObject

@property (nonatomic, strong)   NSString* type;
@property (nonatomic, strong)   NSNumber* amount;
@property (nonatomic, strong)   NSNumber* recurrent;

@end
