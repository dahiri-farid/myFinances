//
//  DFBankAccountViewController.m
//  my_finances
//
//  Created by Dahiri Farid on 8/30/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#import "DFBankAccountViewController.h"
#import "DFInputTextCell.h"

@interface DFBankAccountViewController ()

@end

@implementation DFBankAccountViewController

+ (instancetype)vc
{
    return [[self alloc] initWithStyle:UITableViewStylePlain];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Bank Account";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
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
        [cell updateWithFieldValue:@""
             fieldValuePlaceholder:@"Your balance"
                         inputType:UIKeyboardTypeDecimalPad];
    }
    
    // Configure the cell...
    
    return cell;
}


@end
