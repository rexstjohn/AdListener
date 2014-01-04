//
//  UXRBaseCollectionViewController.m
//
//  Created by Rex St. John on 12/17/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRBaseCollectionViewController.h"

@interface UXRBaseCollectionViewController ()

@end

@implementation UXRBaseCollectionViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setUpFlowLayout];
}

-(void)setUpFlowLayout{
    // Perform layout.
    UICollectionViewFlowLayout *flowLayout = [
                                              [UICollectionViewFlowLayout alloc] init
                                              ];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumLineSpacing = 5.0f;
    flowLayout.minimumInteritemSpacing = 5.0f;
    self.collectionView.collectionViewLayout = flowLayout;
}

#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return 2;
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 2;
}

#pragma mark – UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGSizeMake(0, 55);
    }
    
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (UIInterfaceOrientationPortrait == [[UIApplication sharedApplication] statusBarOrientation]) {
        return CGSizeMake(365.0f,350.0f);
    } else {
        return CGSizeMake(365.0f,350.0f);
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout*)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {
    
    if (UIInterfaceOrientationPortrait == [[UIApplication sharedApplication] statusBarOrientation]) {
        return UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
    } else {
        return UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
    }
}

@end
