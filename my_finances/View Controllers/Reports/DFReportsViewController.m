//
//  DFReportsViewController.m
//  my_finances
//
//  Created by Dahiri Farid on 8/30/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#import "DFReportsViewController.h"
#import "DFReportViewController.h"
#import "DFTitleSubtitleCell.h"

@interface DFReportsViewController ()

@end

@implementation DFReportsViewController

+ (instancetype)vc
{
    return [self.alloc initWithStyle:UITableViewStylePlain];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.rightBarButtonItem =
    [UIBarButtonItem.alloc initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                target:self
                                                action:@selector(addReport:)];
    self.title = @"Reports";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DFTitleSubtitleCell *cell = [tableView dequeueReusableCellWithIdentifier:DFTitleSubtitleCell.ID];
    
    if (cell == nil)
    {
        cell = DFTitleSubtitleCell.cell;
    }
    // Configure the cell...
    [cell updateWithTitle:@"Jan-Jul" subtitle:@"expenses"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DFReportViewController* reportVC = DFReportViewController.vc;
    [self.navigationController pushViewController:reportVC animated:YES];
}

#pragma mark - Actions

- (void)addReport:(id)sender
{
    
}

@end
