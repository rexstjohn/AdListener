//
//  UXRAdDisplayViewController.h
//  AdListener
//
//  Created by Rex St. John on 1/4/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UXRLabel.h"
#import "CMPopTipView.h"

@interface UXRAdDisplayViewController : UIViewController <CMPopTipViewDelegate, UIAlertViewDelegate>
@property(nonatomic,weak) IBOutlet UIImageView* tidePodsImageView;
@property(nonatomic,weak) IBOutlet UIView* starView;;
@property(nonatomic,weak) IBOutlet UIView* questionView;
@property(nonatomic,weak) IBOutlet UXRLabel *questionLabel;
-(IBAction)replayButtonAction:(id)sender;
-(IBAction)wrongButtonAction:(id)sender;
-(IBAction)rightButtonAction:(id)sender;
@end
