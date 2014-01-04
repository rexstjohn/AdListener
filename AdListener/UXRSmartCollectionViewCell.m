//
//  UXRSmartCollectionView.m
//  uxrx
//
//  Smart table view cell take from iOS Recipies. Provides easy access to fetching cell identifiers using the class name
//  and looks after providing it's own dequeuing automatically on demand.
//
//  Created by Rex St John on 1/17/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRSmartCollectionViewCell.h"

@implementation UXRSmartCollectionViewCell

+(id)cellForCollectionView:(UICollectionView*)collectionView
                   fromNib:(UINib*)nib
              forIndexPath:(NSIndexPath*)indexPath{
    
    NSString *cellIdentifier = [self cellIdentifier];
    [collectionView registerClass:[self class]
            forCellWithReuseIdentifier:cellIdentifier];
    [collectionView registerNib:nib forCellWithReuseIdentifier:cellIdentifier];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier
                                                                           forIndexPath:indexPath];
    return cell;
}

+(id)cellForCollectionView:(UICollectionView*)collectionView
              forIndexPath:(NSIndexPath*)indexPath{
    return [[self class] cellForCollectionView:collectionView
                                       fromNib:[self nib]
                                  forIndexPath:indexPath];
}

+ (NSString *)nibName {
    return [self cellIdentifier];
}

+ (NSString *)cellIdentifier {
    [NSException raise:NSInternalInconsistencyException format:@"WARNING: YOU MUST OVERRIDE THIS GETTER IN YOUR CUSTOM CELL .M FILE"];
    static NSString* _cellIdentifier = nil;
    _cellIdentifier = NSStringFromClass([self class]);
    return _cellIdentifier;
}

+(UINib*)nib{
    NSBundle * classBundle = [NSBundle bundleForClass:[self class]];
    UINib * nib = [UINib nibWithNibName:[self nibName]
                                 bundle:classBundle];
    return nib;
}

@end
