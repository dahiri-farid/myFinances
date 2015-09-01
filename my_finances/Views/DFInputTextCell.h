//
//  DFInputTextCell.h
//  my_finances
//
//  Created by Dahiri Farid on 8/30/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DFInputCellType)
{
    DFInputCellDecimalPad,
    DFInputCellText,
    DFInputCellCustom,
};

@interface DFInputTextCell : UITableViewCell

@property (nonatomic, copy) void (^onTextInputFinish)(NSString* aText);
@property (nonatomic, copy) BOOL (^onTextInputChange)(NSString* aText);
@property (nonatomic, copy) void (^onTextInputBegin)(NSString* aText);

+ (instancetype)cell;
+ (NSString *)ID;
+ (CGFloat)height;

- (void)updateWithFieldValue:(NSString *)aFieldValue
       fieldValuePlaceholder:(NSString *)aFieldValuePlaceholder
                   inputType:(DFInputCellType)aInputType;

@end
