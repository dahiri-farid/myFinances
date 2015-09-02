//
//  DFAddIncomeTableViewController.m
//  my_finances
//
//  Created by Dahiri Farid on 8/30/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#import "DFAddIncomeTableViewController.h"
#import "DFInputTextCell.h"
#import "DFIncome.h"
#import "DFDataManager.h"
#import "NSString+Validation.h"

@interface DFAddIncomeTableViewController ()

@property (nonatomic, strong)   NSString* incomeType;
@property (nonatomic, strong)   NSNumber* incomeAmount;

@end

@implementation DFAddIncomeTableViewController

+ (instancetype)vc
{
    return [[self alloc] initWithStyle:UITableViewStylePlain];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Add Income";
    
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
    
    self.incomeAmount = @0;
    self.incomeType = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return DFInputTextCell.height;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DFInputTextCell *cell = (DFInputTextCell*)[tableView dequeueReusableCellWithIdentifier:DFInputTextCell.ID];
    
    __weak typeof (self)weakSelf = self;
    
    if (cell == nil)
    {
        cell = DFInputTextCell.cell;
    }
    
    if (indexPath.row == 0)
    {
        [cell updateWithFieldValue:self.incomeType
             fieldValuePlaceholder:@"Income title"
                         inputType:DFInputCellText];
        
        cell.onTextInputFinish = ^(NSString* aText)
        {
            if (aText.length)
            {
                weakSelf.incomeType = aText;
            }
            else
            {
                [[UIAlertView.alloc initWithTitle:@"Error"
                                          message:@"Invalid type"
                                         delegate:nil
                                cancelButtonTitle:@"Ok"
                                otherButtonTitles:nil] show];
                [weakSelf.tableView reloadData];
            }

        };
    }
    else
    {
        [cell updateWithFieldValue:DF_TO_STR(self.incomeAmount)
             fieldValuePlaceholder:@"Income amount"
                         inputType:DFInputCellDecimalPad];
        
        cell.onTextInputFinish = ^(NSString* aText)
        {
            if (aText.isNumeric)
            {
                weakSelf.incomeAmount = @(aText.doubleValue);
            }
            else
            {
                [[UIAlertView.alloc initWithTitle:@"Error"
                                          message:@"Invalid amount"
                                         delegate:nil
                                cancelButtonTitle:@"Ok"
                                otherButtonTitles:nil] show];
                [weakSelf.tableView reloadData];
            }
        };
    }
    
    // Configure the cell...
    
    return cell;
}

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
    [self.view endEditing:YES];
    
    DFIncome* income = DFIncome.new;
    income.type = self.incomeType;
    income.amount = self.incomeAmount;
    [DFDataManager.instance addIncome:income];
    
    if (self.dismissBlock)
        self.dismissBlock();
}

- (void)cancelAction:(id)sender
{
    if (self.dismissBlock)
        self.dismissBlock();
}

@end
