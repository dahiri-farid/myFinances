//
//  DFTitleSubtitleCell.h
//  my_finances
//
//  Created by Dahiri Farid on 8/30/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DFTitleSubtitleCell : UITableViewCell

+ (instancetype)cell;
+ (NSString *)ID;
+ (CGFloat)height;

- (void)updateWithTitle:(NSString *)aTitle subtitle:(NSString *)aSubtitle;

@end
