//
//  DFReportCollectionHeader.m
//  my_finances
//
//  Created by Dahiri Farid on 9/3/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#import "DFReportCollectionHeader.h"

@implementation DFReportCollectionHeader

+ (UINib *)nib
{
    return [UINib nibWithNibName:NSStringFromClass(self.class) bundle:nil];
}

+ (NSString *)ID
{
    return NSStringFromClass(self.class);
}

- (void)awakeFromNib {
    // Initialization code
}

@end
