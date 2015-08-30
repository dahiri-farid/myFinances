//
//  DFInputTextCell.h
//  my_finances
//
//  Created by Dahiri Farid on 8/30/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DFInputTextCell : UITableViewCell

+ (instancetype)cell;
+ (NSString *)ID;
+ (CGFloat)height;

- (void)updateWithFieldValue:(NSString *)aFieldValue
       fieldValuePlaceholder:(NSString *)aFieldValuePlaceholder
                   inputType:(UIKeyboardType)aKeyboardType;

@end
