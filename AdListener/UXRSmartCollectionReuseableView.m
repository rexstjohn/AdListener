//
//  UXRSmartCollectionReuseableView.m
//  AdListener
//
//  Created by Rex St. John on 1/6/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import "UXRSmartCollectionReuseableView.h"

@implementation UXRSmartCollectionReuseableView

+(id)collectionReusableViewForCollectionView:(UICollectionView*)collectionView
                   fromNib:(UINib*)nib
              forIndexPath:(NSIndexPath*)indexPath
                  withKind:(NSString*)kind{
    
    NSString *cellIdentifier = [self cellIdentifier];
    [collectionView registerClass:[self class] forSupplementaryViewOfKind:kind withReuseIdentifier:cellIdentifier];
    [collectionView registerNib:nib forSupplementaryViewOfKind:kind withReuseIdentifier:cellIdentifier]; 
    UXRSmartCollectionReuseableView *cell = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    return cell;
}

-(void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    [super applyLayoutAttributes:layoutAttributes];
    
    //
}

+(id)collectionReusableViewForCollectionView:(UICollectionView*)collectionView
              forIndexPath:(NSIndexPath*)indexPath withKind:(NSString*)kind{
    return [[self class] collectionReusableViewForCollectionView:collectionView
                                       fromNib:[self nib]
                                  forIndexPath:indexPath
            withKind:kind];
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
