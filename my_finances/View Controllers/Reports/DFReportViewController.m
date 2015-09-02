//
//  DFReportViewController.m
//  my_finances
//
//  Created by Dahiri Farid on 9/3/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#import "DFReportViewController.h"
#import "DFReportValueCell.h"
#import "DFReportCollectionHeader.h"

@interface DFReportViewController ()

@end

@implementation DFReportViewController

static NSString * const reuseIdentifier = @"Cell";

+ (instancetype)vc
{
    return [self.alloc initWithCollectionViewLayout:UICollectionViewFlowLayout.alloc.init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    
    UICollectionViewFlowLayout* flowLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    
    flowLayout.itemSize = DFReportValueCell.size;
    flowLayout.minimumInteritemSpacing = 0.0f;
    flowLayout.minimumLineSpacing = 0.0f;
    flowLayout.headerReferenceSize = CGSizeMake(self.view.bounds.size.width, 300.0f);
    
    [self.collectionView registerNib:DFReportValueCell.nib
          forCellWithReuseIdentifier:DFReportValueCell.ID];
    
    self.collectionView.backgroundColor = UIColor.whiteColor;
    
    [self.collectionView registerNib:DFReportCollectionHeader.nib
          forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                 withReuseIdentifier:DFReportCollectionHeader.ID];
    
    // Do any additional setup after loading the view.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DFReportValueCell *cell = [collectionView
                               dequeueReusableCellWithReuseIdentifier:DFReportValueCell.ID
                                                                        forIndexPath:indexPath];
    
    // Configure the cell
    
    [cell updateTitle:@"test"];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader)
    {
        DFReportCollectionHeader* header =
        [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                           withReuseIdentifier:DFReportCollectionHeader.ID
                                                  forIndexPath:indexPath];
        return header;
    }
    return nil;
}

@end
