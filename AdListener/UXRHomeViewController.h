//
//  UXRHomeViewController.h
//  AdListener
//
//  Created by Rex St. John on 1/4/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UXRButton.h"

@interface UXRHomeViewController : UIViewController
@property(nonatomic,weak) IBOutlet UXRButton *listenButton;
@property(nonatomic,weak) IBOutlet UXRButton *redeemPointsButton;
@property(nonatomic,weak) IBOutlet UXRButton *skipButton;
@property(nonatomic,weak) IBOutlet UXRButton *cancelButton;
@property(nonatomic,weak) IBOutlet UIView *profileView;
@property(nonatomic,weak) IBOutlet UIImageView *listenImageView;
-(IBAction)didTapListen:(id)sender;
-(IBAction)didTapRedeemPoints:(id)sender;
-(IBAction)didTapSkip:(id)sender;
-(IBAction)didTapCancel:(id)sender;
@end
