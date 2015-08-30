//
//  DFTitleSubtitleCell.m
//  my_finances
//
//  Created by Dahiri Farid on 8/30/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#import "DFTitleSubtitleCell.h"

@implementation DFTitleSubtitleCell

+ (instancetype)cell
{
    return [self.alloc initWithStyle:UITableViewCellStyleSubtitle
                                reuseIdentifier:NSStringFromClass(self.class)];
}

+ (NSString *)ID
{
    return NSStringFromClass(self.class);
}

+ (CGFloat)height
{
    return 44.0f;
}

- (void)updateWithTitle:(NSString *)aTitle subtitle:(NSString *)aSubtitle
{
    NSParameterAssert(aTitle);
    NSParameterAssert(aSubtitle);
    
    self.textLabel.text = aTitle;
    self.detailTextLabel.text = aSubtitle;
}

@end
