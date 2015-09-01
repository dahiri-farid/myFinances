//
//  DFInputTextCell.m
//  my_finances
//
//  Created by Dahiri Farid on 8/30/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#import "DFInputTextCell.h"

@interface DFInputTextCell () <UITextFieldDelegate>

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
    self.ibFieldValue.delegate = self;
}

- (void)updateWithFieldValue:(NSString *)aFieldValue
       fieldValuePlaceholder:(NSString *)aFieldValuePlaceholder
                   inputType:(DFInputCellType)aInputType
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (aInputType == DFInputCellDecimalPad)
    {
        self.ibFieldValue.keyboardType = UIKeyboardTypeNumberPad;
    }
    else if (aInputType == DFInputCellText)
    {
        self.ibFieldValue.keyboardType = UIKeyboardTypeAlphabet;
    }
    else if (aInputType == DFInputCellCustom)
    {
        self.ibFieldValue.userInteractionEnabled = NO;
    }
    else
    {
        NSAssert(NO, @"Not Implemented!");
    }
    
    self.ibFieldValue.text = aFieldValue;
    self.ibFieldValue.placeholder = aFieldValuePlaceholder;
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSParameterAssert(textField == self.ibFieldValue);
    
    if (self.onTextInputBegin)
        self.onTextInputBegin(textField.text);
}

- (BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string
{
    NSParameterAssert(self.ibFieldValue == textField);
    NSString* replacement = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (self.onTextInputChange)
        return self.onTextInputChange(replacement);
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSParameterAssert(self.ibFieldValue == textField);
    
    if (self.onTextInputFinish)
        self.onTextInputFinish(textField.text);
}

@end
