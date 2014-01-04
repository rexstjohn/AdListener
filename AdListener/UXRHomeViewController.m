//
//  UXRHomeViewController.m
//  AdListener
//
//  Created by Rex St. John on 1/4/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import "UXRHomeViewController.h"
#import "UIView+SimpleSizing.h"
#import "UIImage+animatedGIF.h"

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
    [self.listeningLabel setFrameX:1000];
}

#pragma mark - Actions.

-(IBAction)didTapListen:(id)sender{
    
    [UIView animateWithDuration:1.0f animations:^{
        self.listenImageView.alpha = 1;
        self.skipButton.alpha = 0;
        self.profileView.alpha = 0;
        self.listenButton.alpha = 0;
        self.cancelButton.alpha = 1;
        self.equalizerImageView.alpha = 1;
        [self.listeningLabel setFrameX:self.listenImageView.center.x - self.listeningLabel.frame.size.width / 2];
    }];
    
    // Fake the listening process.
    [NSTimer scheduledTimerWithTimeInterval:3
                                                      target:self
                                                    selector:@selector(didDetectAdvertisement) userInfo:nil
                                                     repeats:NO];
    
    // Animated gif.
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"equalizer_white_2" withExtension:@"gif"];
    self.equalizerImageView.image = [UIImage animatedImageWithAnimatedGIFData:[NSData dataWithContentsOfURL:url]];
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
        self.equalizerImageView.alpha = 0;
        [self.listeningLabel setFrameX:1000];
    }];
}

-(IBAction)didTapEarnPoints:(id)sender{
    
}

#pragma mark - Listening Logic

-(void)didDetectAdvertisement{
    
    [UIView animateWithDuration:1.0f animations:^{
        [self.listeningLabel setFrameX:1000];
        self.listenImageView.alpha = .5;
        self.cancelButton.alpha = 0;
        self.equalizerImageView.alpha = 0;
        self.detectedButton.alpha = 1;
    }];
}

@end