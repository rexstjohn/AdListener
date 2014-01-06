//
//  UXRHomeHorizontalCollectionViewController.m
//
//  Created by Rex St. John on 12/17/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRHomeAdCollectionViewController.h"
#import "UXRNowPlayingCollectionViewCell.h"
#import "UXRUserInfoHeaderView.h"
#import "UXRHeaderCollectionReuseableView.h"
#import "UXRAdDisplayViewController.h"
#import "UXRGlobals.h"
#import "CMPopTipView.h"

@interface UXRHomeAdCollectionViewController ()
@property(nonatomic,strong) NSArray *homeScreenImages;
@property(nonatomic,strong) NSArray *homeScreenTitles;
@property(nonatomic,strong) UXRHeaderCollectionReuseableView *headerView;
@property(nonatomic,strong) CMPopTipView *popTipView;
@end

@implementation UXRHomeAdCollectionViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"Watch ads, get points";
    self.homeScreenImages = @[@"nordstrom.jpg",@"twix.jpg", @"phillips.jpg", @"wheaties.jpg", @"norelco.jpg", @"tiffany.jpg", @"tidepods.png"];
    self.homeScreenTitles = @[@"Nordstrom",@"Twix",  @"Phillips", @"Wheaties", @"Norelco", @"Tiffany", @"Tidepods"];
    
    //
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didTapRewatch:) name:REWATCH_REQUEST_NOTIFICATION object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didTapListen:) name:LISTEN_REQUEST_NOTIFICATION object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didTapRedeem:) name:REDEEM_REQUEST_NOTIFICATION object:nil];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    //
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.popTipView dismissAnimated:YES];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        self.headerView = [UXRHeaderCollectionReuseableView collectionReusableViewForCollectionView:collectionView forIndexPath:indexPath withKind:kind];
        reusableview = self.headerView;
        
    }
    
    return reusableview;
}

#pragma mark - Pop up tip delegate

- (void)popTipViewWasDismissedByUser:(CMPopTipView *)popTipView{
    
}

#pragma mark -

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return _homeScreenImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UXRNowPlayingCollectionViewCell *cell = [UXRNowPlayingCollectionViewCell cellForCollectionView:self.collectionView forIndexPath:indexPath];
    cell.titleLabel.text = self.homeScreenTitles[indexPath.row];
    NSString *imagePath = self.homeScreenImages[indexPath.row];
    [cell.imageView setImage:[UIImage imageNamed:imagePath]];
    
    //
    
    return cell;
}

#pragma mark - Actions

-(void)didTapRewatch:(NSNotification*)sender{
    [self performSegueWithIdentifier:WATCH_AD_SEGUE sender:@"tide"];
}

-(void)didTapListen:(NSNotification*)sender{
    [self performSegueWithIdentifier:LISTEN_SEGUE sender:self];
}

-(void)didTapRedeem:(NSNotification*)sender{
    [self performSegueWithIdentifier:REDEEM_SEGUE sender:self];
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

#pragma mark - Selections

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *item = self.homeScreenTitles[indexPath.row];
    
    if([item isEqualToString:@"Twix"] == YES){
        [self performSegueWithIdentifier:WATCH_AD_SEGUE sender:item];
    }
}

#pragma mark - Segues

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSString *segueId = [segue identifier];
    
    if([segueId isEqualToString:WATCH_AD_SEGUE]){
        UXRAdDisplayViewController *adViewController = (UXRAdDisplayViewController*)[segue destinationViewController];
        adViewController.adType = (NSString*)sender;
    } else if([segueId isEqualToString:REDEEM_SEGUE]){
        
    } else if([segueId isEqualToString:LISTEN_SEGUE]){
        
    }
}

@end
