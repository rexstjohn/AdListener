//
//  UXRHomeHorizontalCollectionViewController.m
//
//  Created by Rex St. John on 12/17/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRHomeHorizontalCollectionViewController.h"
#import "UXRHomeCollectionViewCell.h"

@interface UXRHomeHorizontalCollectionViewController ()
@property(nonatomic,strong) NSArray *homeScreenItems;
@end

@implementation UXRHomeHorizontalCollectionViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.homeScreenItems = @[@"Nearby", @"Photos", @"Best Reviewed", @"Reservations"];
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return _homeScreenItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UXRHomeCollectionViewCell *cell = [UXRHomeCollectionViewCell cellForCollectionView:self.collectionView forIndexPath:indexPath];
    //cell.backgroundColor = [UIColor whiteColor];
    //cell.titleLabel.text = self.homeScreenItems[indexPath.row + indexPath.section + 1];
    
    return cell;
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return YES;
}


@end
