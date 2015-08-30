//
//  DFInputTextCell.m
//  my_finances
//
//  Created by Dahiri Farid on 8/30/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#import "DFInputTextCell.h"

@interface DFInputTextCell ()

@property (nonatomic, strong)   IBOutlet    UITextField* ibFieldValue;

@end

@implementation DFInputTextCell

+ (instancetype)cell
{
    return [[NSBundle.mainBundle loadNibNamed:NSStringFromClass(self.class) owner:nil options:nil] firstObject];
}

+ (NSString *)ID
{
    return NSStringFromClass(self.class);
}

+ (CGFloat)height
{
    return 44.0f;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)updateWithFieldValue:(NSString *)aFieldValue
      fieldValuePlaceholder:(NSString *)aFieldValuePlaceholder
                  inputType:(UIKeyboardType)aKeyboardType
{
    self.ibFieldValue.keyboardType = aKeyboardType;
    
    self.ibFieldValue.text = aFieldValue;
    self.ibFieldValue.placeholder = aFieldValuePlaceholder;
}

@end
