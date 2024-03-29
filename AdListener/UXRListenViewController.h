//
//  UXRHomeViewController.h
//  AdListener
//
//  Created by Rex St. John on 1/4/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UXRButton.h"
#import "UXRLabel.h"
#import "CMPopTipView.h"

@interface UXRListenViewController : UIViewController <CMPopTipViewDelegate>
@property(nonatomic,weak) IBOutlet UXRButton *listenButton;
@property(nonatomic,weak) IBOutlet UXRButton *redeemPointsButton;
@property(nonatomic,weak) IBOutlet UXRButton *cancelButton;
@property(nonatomic,weak) IBOutlet UXRButton *detectedButton;
@property(nonatomic,weak) IBOutlet UXRLabel *listeningLabel;
@property(nonatomic,weak) IBOutlet UIView *detectedView;
@property(nonatomic,weak) IBOutlet UIImageView *listenImageView;
@property(nonatomic,weak) IBOutlet UIImageView *equalizerImageView;
@property(nonatomic,weak) IBOutlet UXRButton* closeButton;
-(IBAction)didTapListen:(id)sender; 
-(IBAction)didTapCancel:(id)sender;
-(IBAction)didTapEarnPoints:(id)sender;
@end
