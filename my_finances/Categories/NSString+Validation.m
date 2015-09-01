//
//  NSString+Validation.m
//  my_finances
//
//  Created by Dahiri Farid on 9/1/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#import "NSString+Validation.h"

@implementation NSString (Validation)

- (BOOL)isNumeric
{
    
    NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
    
    NSNumber* number = [numberFormatter numberFromString:self];
    
    return number != nil;
}

@end
