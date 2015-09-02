//
//  DFExpensesViewController.m
//  my_finances
//
//  Created by Dahiri Farid on 8/30/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#import "DFExpensesViewController.h"
#import "DFAddExpenceViewController.h"
#import "DFTitleSubtitleCell.h"
#import "DFDataManager.h"
#import "DFExpense.h"

@interface DFExpensesViewController ()

@property (nonatomic, strong)   NSArray* datasource;

@end

@implementation DFExpensesViewController

+ (instancetype)vc
{
    return [[self alloc] initWithStyle:UITableViewStylePlain];
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
                                                action:@selector(addExpense:)];
    self.title = @"Expenses";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.datasource = DFDataManager.instance.expenses;
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.datasource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DFTitleSubtitleCell *cell = [tableView dequeueReusableCellWithIdentifier:DFTitleSubtitleCell.ID];
    
    if (cell == nil)
    {
        cell = DFTitleSubtitleCell.cell;
    }
    DFExpense* expense = self.datasource[indexPath.row];
    // Configure the cell...
    [cell updateWithTitle:expense.type subtitle:DF_TO_STR(expense.amount)];
    
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

- (void)addExpense:(id)sender
{
    DFAddExpenceViewController* addExpenseVC = DFAddExpenceViewController.vc;
    UINavigationController* nc = [UINavigationController.alloc initWithRootViewController:addExpenseVC];
    [self presentViewController:nc animated:YES completion:nil];
    
    __weak typeof (self)weakSelf = self;
    addExpenseVC.dismissBlock = ^
    {
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    };
}

@end
