//
//  DFAddExpenceViewController.m
//  my_finances
//
//  Created by Dahiri Farid on 8/30/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#import "DFAddExpenceViewController.h"
#import "DFInputTextCell.h"
#import "DFSegmentedControlCell.h"
#import "DFDataManager.h"
#import "DFExpense.h"

@interface DFAddExpenceViewController ()

@end

@implementation DFAddExpenceViewController

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
    self.title = @"Add Expense";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    self.navigationItem.rightBarButtonItem =
    [UIBarButtonItem.alloc initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                target:self
                                                action:@selector(doneAction:)];
    self.navigationItem.leftBarButtonItem =
    [UIBarButtonItem.alloc initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                target:self
                                                action:@selector(cancelAction:)];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;

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
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = nil;

    if (indexPath.row == 0)
    {
        DFSegmentedControlCell* segmentCell = [tableView dequeueReusableCellWithIdentifier:DFSegmentedControlCell.ID];
        if (segmentCell == nil)
        {
            segmentCell = DFSegmentedControlCell.cell;
        }
        [segmentCell updateWithValues:@[@"ad-hoc", @"recurring"]];
        segmentCell.selectedIndex = 0;
        cell = segmentCell;
    }
    else
    {
        DFInputTextCell* textCell = [tableView dequeueReusableCellWithIdentifier:DFInputTextCell.ID];
        if (textCell == nil)
        {
            textCell = DFInputTextCell.cell;
        }
        cell = textCell;
        
        if (indexPath.row == 1)
        {
            [textCell updateWithFieldValue:@""
                     fieldValuePlaceholder:@"Type"
                                 inputType:DFInputCellText];
        }
        else
        {
            [textCell updateWithFieldValue:@""
                     fieldValuePlaceholder:@"Amount"
                                 inputType:DFInputCellDecimalPad];
        }
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Actions

- (void)doneAction:(id)sender
{
    if (self.dismissBlock)
        self.dismissBlock();
}

- (void)cancelAction:(id)sender
{
    if (self.dismissBlock)
        self.dismissBlock();
}

@end
