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

@interface UXRHomeViewController : UIViewController
@property(nonatomic,weak) IBOutlet UXRButton *listenButton;
@property(nonatomic,weak) IBOutlet UXRButton *redeemPointsButton;
@property(nonatomic,weak) IBOutlet UXRButton *skipButton;
@property(nonatomic,weak) IBOutlet UXRButton *cancelButton;
@property(nonatomic,weak) IBOutlet UXRButton *detectedButton;
@property(nonatomic,weak) IBOutlet UXRLabel *listeningLabel;
@property(nonatomic,weak) IBOutlet UIView *profileView;
@property(nonatomic,weak) IBOutlet UIView *detectedView;
@property(nonatomic,weak) IBOutlet UIImageView *listenImageView;
@property(nonatomic,weak) IBOutlet UIImageView *equalizerImageView;
-(IBAction)didTapListen:(id)sender;
-(IBAction)didTapRedeemPoints:(id)sender;
-(IBAction)didTapSkip:(id)sender;
-(IBAction)didTapCancel:(id)sender;
-(IBAction)didTapEarnPoints:(id)sender;
@end
