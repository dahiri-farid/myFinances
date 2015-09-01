
//
//  DFSegmentedControlCell.m
//  my_finances
//
//  Created by Dahiri Farid on 8/31/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//
#import "DFSegmentedControlCell.h"

@interface DFSegmentedControlCell ()

@property (nonatomic, strong)   IBOutlet    UISegmentedControl* ibSegment;

@end

@implementation DFSegmentedControlCell

+ (instancetype)cell
{
    return [NSBundle.mainBundle loadNibNamed:NSStringFromClass(self.class)
                                       owner:nil
                                     options:nil].firstObject;
}

+ (CGFloat)height
{
    return 45.0f;
}

+ (NSString *)ID
{
    return NSStringFromClass(self.class);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateWithValues:(NSArray *)aValues
{
    [self.ibSegment removeAllSegments];
    
    for (NSInteger i = 0; i < aValues.count; ++i)
    {
        NSString* value = aValues[i];
        [self.ibSegment insertSegmentWithTitle:value atIndex:i animated:NO];
    }
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    self.ibSegment.selectedSegmentIndex = selectedIndex;
}

- (NSUInteger)selectedIndex
{
    return self.ibSegment.selectedSegmentIndex;
}

#pragma mark - Custom Actions

- (IBAction)onClick:(id)sender
{
    if (self.clickBlock)
        self.clickBlock(self.ibSegment.selectedSegmentIndex);
}

@end
