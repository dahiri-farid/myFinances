//
//  DFSegmentedControlCell.h
//  my_finances
//
//  Created by Dahiri Farid on 8/31/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DFSegmentedControlCell : UITableViewCell

@property (nonatomic, copy) void (^clickBlock)(NSUInteger aIndex);
@property (nonatomic, assign)   NSUInteger selectedIndex;

- (void)updateWithValues:(NSArray *)aValues;

+ (instancetype)cell;
+ (CGFloat)height;
+ (NSString *)ID;

@end
