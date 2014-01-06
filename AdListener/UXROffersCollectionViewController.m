//
//  UXRHomeCollectionViewController.m
//
//  Created by Rex St. John on 12/16/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXROffersCollectionViewController.h" 
#import "UXROfferCollectionViewCell.h"
#import "UXRRedeemCollectionReusableView.h"

@interface UXROffersCollectionViewController ()
@property(nonatomic,strong) NSArray *homeScreenTitles;
@property(nonatomic,strong) NSArray *homeScreenImages;
@property(nonatomic,strong) UXRRedeemCollectionReusableView *headerView;
@end

@implementation UXROffersCollectionViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.homeScreenTitles = @[@"  Netflix $12.99 / month", @"  Amazon Prime", @"  Starbucks"];
    self.homeScreenImages = @[@"netflix.jpg", @"amazon-prime.jpg", @"starbucks.gif"];
    self.navigationController.navigationBarHidden = NO;
    self.title = @"Redeem your points";
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UXROfferCollectionViewCell *cell = [UXROfferCollectionViewCell cellForCollectionView:self.collectionView forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.titleLabel.text = self.homeScreenTitles[indexPath.row];
    cell.backgroundImageView.image = [UIImage imageNamed:self.homeScreenImages[indexPath.row]];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        self.headerView = [UXRRedeemCollectionReusableView collectionReusableViewForCollectionView:collectionView forIndexPath:indexPath withKind:kind];
        reusableview = self.headerView;
        [self.headerView.closeButton addTarget:self action:@selector(didTapClose:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return reusableview;
}

#pragma mark - Action

-(IBAction)didTapClose:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UICollectionView Datasource

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return self.homeScreenTitles.count;
}

@end
