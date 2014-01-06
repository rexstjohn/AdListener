//
//  UXRHomeHorizontalCollectionViewController.m
//
//  Created by Rex St. John on 12/17/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRHomeHorizontalCollectionViewController.h"
#import "UXROfferCollectionViewCell.h"
#import "UXRUserInfoHeaderView.h"
#import "UXRHeaderCollectionReuseableView.h"

@interface UXRHomeHorizontalCollectionViewController ()
@property(nonatomic,strong) NSArray *homeScreenImages;
@property(nonatomic,strong) NSArray *homeScreenTitles;
@property(nonatomic,strong) UXRHeaderCollectionReuseableView *headerView;
@end

@implementation UXRHomeHorizontalCollectionViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.homeScreenImages = @[@"nordstrom.jpg", @"phillips.jpg", @"wheaties.jpg", @"norelco.jpg", @"tiffany.jpg", @"tidepods.png"];
    self.homeScreenTitles = @[@"Nordstrom", @"Phillips", @"Wheaties", @"Norelco", @"Tiffany", @"Tidepods"];
    
    //
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didTapRewatch:) name:@"REWATCH_NOTIFICAITON" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didTapListen:) name:@"LISTEN_NOTIFICAITON" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didTapRedeem:) name:@"REDEEM_NOTIFICAITON" object:nil];
}

#pragma mark - Flow Layout

-(void)setUpFlowLayout{
    // Perform layout.
    UICollectionViewFlowLayout *flowLayout = [
                                              [UICollectionViewFlowLayout alloc] init
                                              ];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 10.0f;
    flowLayout.minimumInteritemSpacing = 10.0f;
    //Uncomment to add a header.
    flowLayout.headerReferenceSize = [UXRHeaderCollectionReuseableView sizeForHeaderView];
    self.collectionView.collectionViewLayout = flowLayout;
}

#pragma mark - Collection Header

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        self.headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UXRHeaderCollectionReuseableView" forIndexPath:indexPath];
        reusableview = self.headerView;
    }
    
    if (kind == UICollectionElementKindSectionFooter) {
        //        UICollectionReusableView *footerview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
        //
        //        reusableview = footerview;
    }
    
    return reusableview;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
//    NOTE: In horizontal layout, the width is used for the height
//    // Return proper header sizing.
//    if (section == 0) {
//        return CGSizeMake(64,0);
//    }
//    
//    return CGSizeZero;
//}

#pragma mark -

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return _homeScreenImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UXROfferCollectionViewCell *cell = [UXROfferCollectionViewCell cellForCollectionView:self.collectionView forIndexPath:indexPath];
    cell.titleLabel.text = self.homeScreenTitles[indexPath.row];
    NSString *imagePath = self.homeScreenImages[indexPath.row];
    [cell.backgroundImageView setImage:[UIImage imageNamed:imagePath]];
    
    //
    
    return cell;
}

#pragma mark - Actions

-(void)didTapRewatch:(id)sender{
    [self performSegueWithIdentifier:@"PushAdViewSegue" sender:self];
}

-(void)didTapListen:(id)sender{
    [self performSegueWithIdentifier:@"PushListenSegue" sender:self];
}


-(void)didTapRedeem:(id)sender{
    [self performSegueWithIdentifier:@"PushRedeemSegue" sender:self];
}

#pragma mark - Gesutres

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return YES;
}

#pragma mark – UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (UIInterfaceOrientationPortrait == [[UIApplication sharedApplication] statusBarOrientation]) {
        return CGSizeMake(600.0f,600.0f);
    } else {
        return CGSizeMake(600.0f,600.0f);
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
