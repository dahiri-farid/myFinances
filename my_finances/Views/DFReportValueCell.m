//
//  DFReportValueCell.m
//  my_finances
//
//  Created by Dahiri Farid on 9/3/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#import "DFReportValueCell.h"

@interface DFReportValueCell ()

@property (nonatomic, strong)   IBOutlet UILabel* ibTitle;

@end

@implementation DFReportValueCell

+ (UINib *)nib
{
    return [UINib nibWithNibName:NSStringFromClass(self.class) bundle:nil];
}

+ (CGSize)size
{
    return CGSizeMake(120.0f, 40.0f);
}

+ (NSString *)ID
{
    return NSStringFromClass(self.class);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)updateTitle:(NSString *)aTitle
{
    self.ibTitle.text = aTitle;
}

@end
