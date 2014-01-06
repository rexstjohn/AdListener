//
//  UXRHomeCollectionViewController.m
//
//  Created by Rex St. John on 12/16/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRHomeCollectionViewController.h" 
#import "UXRHomeCollectionViewCell.h"
#import "UXRBaseCollectionReuseableView.h"

@interface UXRHomeCollectionViewController ()
@property(nonatomic,strong) NSArray *homeScreenItems;
@end

@implementation UXRHomeCollectionViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.homeScreenItems = @[@"Nearby", @"Photos", @"Best Reviewed", @"Reservations"];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UXRHomeCollectionViewCell *cell = [UXRHomeCollectionViewCell cellForCollectionView:self.collectionView forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    //cell.titleLabel.text = self.homeScreenItems[indexPath.row + indexPath.section + 1];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        UXRBaseCollectionReuseableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UXRHomeCollectionHeaderReusableView" forIndexPath:indexPath];
        reusableview = headerView;
    }
    
    if (kind == UICollectionElementKindSectionFooter) {
//        UICollectionReusableView *footerview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
//        
//        reusableview = footerview;
    }
    
    return reusableview;
}
@end
