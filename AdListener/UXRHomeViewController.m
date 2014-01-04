//
//  UXRHomeViewController.m
//  AdListener
//
//  Created by Rex St. John on 1/4/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import "UXRHomeViewController.h"

@interface UXRHomeViewController ()

@end

@implementation UXRHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
}

#pragma mark - Actions.

-(IBAction)didTapListen:(id)sender{
    
    [UIView animateWithDuration:1.0f animations:^{
        self.listenImageView.alpha = 1;
        self.skipButton.alpha = 0;
        self.profileView.alpha = 0;
        self.listenButton.alpha = 0;
        self.cancelButton.alpha = 1;
    }];
}

-(IBAction)didTapRedeemPoints:(id)sender{
    
}

-(IBAction)didTapSkip:(id)sender{
    
}

-(IBAction)didTapCancel:(id)sender{
    
    [UIView animateWithDuration:1.0f animations:^{
        self.listenImageView.alpha = .5;
        self.skipButton.alpha = 1;
        self.profileView.alpha = 1;
        self.listenButton.alpha = 1;
        self.cancelButton.alpha = 0;
    }];
}

@end
