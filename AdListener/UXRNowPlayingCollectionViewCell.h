//
//  UXRNowPlayingCollectionViewCell.h
//  AdListener
//
//  Created by Rex St. John on 1/3/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import "UXRSmartCollectionViewCell.h"
#import "UXRImageView.h"

@interface UXRNowPlayingCollectionViewCell : UXRSmartCollectionViewCell
@property(nonatomic,weak) IBOutlet UXRImageView* imageView;
@end
