//
//  UXRAdDisplayViewController.h
//  AdListener
//
//  Created by Rex St. John on 1/4/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UXRAdDisplayViewController : UIViewController
@property(nonatomic,weak) IBOutlet UIImageView* tidePodsImageView;
@property(nonatomic,weak) IBOutlet UIView* questionView;
-(IBAction)replayButtonAction:(id)sender;
-(IBAction)wrongButtonAction:(id)sender;
-(IBAction)rightButtonAction:(id)sender;
@end
