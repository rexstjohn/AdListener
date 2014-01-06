//
//  UXRSmartCollectionReuseableView.h
//  AdListener
//
//  Created by Rex St. John on 1/6/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UXRSmartCollectionReuseableView : UICollectionReusableView

+(NSString*)cellIdentifier;
+(id)collectionReusableViewForCollectionView:(UICollectionView*)collectionView
                   fromNib:(UINib*)nib
              forIndexPath:(NSIndexPath*)indexPath
                  withKind:(NSString*)kind;

+(id)collectionReusableViewForCollectionView:(UICollectionView*)collectionView
              forIndexPath:(NSIndexPath*)indexPath withKind:(NSString*)kind;

+(UINib*)nib;

@end
