//
//  UXRHomeHorizontalCollectionViewController.m
//
//  Created by Rex St. John on 12/17/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRHomeHorizontalCollectionViewController.h"
#import "UXRHomeCollectionViewCell.h"
#import "UXRHeaderCollectionReuseableView.h"

@interface UXRHomeHorizontalCollectionViewController ()
@property(nonatomic,strong) NSArray *homeScreenImages;
@property(nonatomic,strong) NSArray *homeScreenTitles;
@end

@implementation UXRHomeHorizontalCollectionViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.homeScreenImages = @[@"nordstrom.jpg", @"phillips.jpg", @"wheaties.jpg", @"norelco.jpg", @"tiffany.jpg", @"tidepods.png"];
    self.homeScreenTitles = @[@"Nordstrom", @"Phillips", @"Wheaties", @"Norelco", @"Tiffany", @"Tidepods"];
}


#pragma mark - Collection Header

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        UXRHeaderCollectionReuseableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UXRHeaderCollectionReuseableView" forIndexPath:indexPath];
        reusableview = headerView;
    }
    
    if (kind == UICollectionElementKindSectionFooter) {
        //        UICollectionReusableView *footerview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
        //
        //        reusableview = footerview;
    }
    
    return reusableview;
}

#pragma mark -

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return _homeScreenImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UXRHomeCollectionViewCell *cell = [UXRHomeCollectionViewCell cellForCollectionView:self.collectionView forIndexPath:indexPath];
    cell.titleLabel.text = self.homeScreenTitles[indexPath.row];
    NSString *imagePath = self.homeScreenImages[indexPath.row];
    [cell.backgroundImageView setImage:[UIImage imageNamed:imagePath]];
    return cell;
}


#pragma mark - Gesutres

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return YES;
}


@end
