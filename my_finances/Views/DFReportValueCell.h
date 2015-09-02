//
//  DFReportValueCell.h
//  my_finances
//
//  Created by Dahiri Farid on 9/3/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DFReportValueCell : UICollectionViewCell

+ (UINib *)nib;
+ (CGSize)size;
+ (NSString *)ID;

- (void)updateTitle:(NSString *)aTitle;

@end
