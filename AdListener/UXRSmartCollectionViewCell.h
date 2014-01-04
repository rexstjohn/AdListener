//
//  UXRSmartCollectionView.h
//  uxrx
//
//  Smart table view cell take from iOS Recipies. Provides easy access to fetching cell identifiers using the class name
//  and looks after providing it's own dequeuing automatically on demand.
//
//  Created by Rex St John on 1/17/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UXRSmartCollectionViewCell : UICollectionViewCell

+(NSString*)cellIdentifier;
+(id)cellForCollectionView:(UICollectionView*)collectionView fromNib:(UINib*)nib forIndexPath:(NSIndexPath*)indexPath;
+(id)cellForCollectionView:(UICollectionView*)collectionView forIndexPath:(NSIndexPath*)indexPath;
+(UINib*)nib;

@end
