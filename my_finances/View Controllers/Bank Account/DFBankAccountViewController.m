//
//  DFBankAccountViewController.m
//  my_finances
//
//  Created by Dahiri Farid on 8/30/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#import "DFBankAccountViewController.h"
#import "DFInputTextCell.h"
#import "DFDataManager.h"
#import "DFBankAccount.h"
#import "NSString+Validation.h"

@interface DFBankAccountViewController ()

@property (nonatomic, strong)   UIBarButtonItem* doneBarButtonItem;

@end

@implementation DFBankAccountViewController

+ (instancetype)vc
{
    return [[self alloc] initWithStyle:UITableViewStylePlain];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Bank Account";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    self.doneBarButtonItem =
    [UIBarButtonItem.alloc initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                target:self
                                                action:@selector(doneAction:)];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
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
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DFInputTextCell *cell = (DFInputTextCell*)[tableView dequeueReusableCellWithIdentifier:DFInputTextCell.ID];
    
    if (cell == nil)
    {
        cell = DFInputTextCell.cell;
    }
    
    if (indexPath.row == 0)
    {
        NSString* accountBalance = [NSString stringWithFormat:@"%@", DFDataManager.instance.bankAccount.balance];
        
        [cell updateWithFieldValue:accountBalance
             fieldValuePlaceholder:@"Your balance"
                         inputType:DFInputCellDecimalPad];
        
        __weak typeof (self)weakSelf = self;
        cell.onTextInputBegin = ^(NSString* aText)
        {
            weakSelf.navigationItem.rightBarButtonItem = self.doneBarButtonItem;
        };
        
        cell.onTextInputFinish = ^(NSString* aText)
        {
            if (aText.isNumeric)
            {
                DFBankAccount* bankAccount = DFDataManager.instance.bankAccount;
                [bankAccount updateBalance:@(aText.doubleValue)];
                [DFDataManager.instance saveBankAccount:bankAccount];
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
            weakSelf.navigationItem.rightBarButtonItem = nil;
        };
    }
    
    // Configure the cell...
    
    return cell;
}

#pragma mark - Custom actions

- (void)doneAction:(id)sender
{
    [self.view endEditing:YES];
}


@end
