//
//  UXRHomeViewController.m
//  AdListener
//
//  Created by Rex St. John on 1/4/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import "UXRListenViewController.h"
#import "UIView+SimpleSizing.h"
#import "UIImage+animatedGIF.h"
#import "StarRatingView.h"
#import "UXRAdDisplayViewController.h"

@interface UXRListenViewController ()
@property(nonatomic,assign) BOOL wasCancelled;
@end

@implementation UXRListenViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.listeningLabel setFrameX:1000];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
} 

#pragma mark - Pop up tip delegate

- (void)popTipViewWasDismissedByUser:(CMPopTipView *)popTipView{
    
}

#pragma mark - Actions.

-(IBAction)didTapListen:(id)sender{
    self.wasCancelled = NO; 
    
    [UIView animateWithDuration:1.0f animations:^{
        self.listenImageView.alpha = 1; 
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

-(IBAction)didTapCancel:(id)sender{
    self.wasCancelled = YES;
    [UIView animateWithDuration:1.0f animations:^{
        self.listenImageView.alpha = .5; 
        self.equalizerImageView.alpha = 0;
        self.listenButton.alpha=1;
        self.cancelButton.alpha =0;
        [self.listeningLabel setFrameX:1000];
    }];
}

-(IBAction)didTapEarnPoints:(id)sender{
    //
    [self performSegueWithIdentifier:AD_DETECTED_SEGUE sender:self];
}

-(IBAction)closeButtonAction:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Listening Logic

-(void)didDetectAdvertisement{
    
    if(self.wasCancelled == YES){
        return;
    }
    
    self.detectedView.alpha = 0;
    self.detectedView.hidden = NO;
    [UIView animateWithDuration:1.0f animations:^{
        [self.listeningLabel setFrameX:1000];
        self.listenImageView.alpha = .5;
        self.cancelButton.alpha = 0;
        self.equalizerImageView.alpha = 0;
        self.detectedView.alpha = 1;
    }];
}

#pragma mark - Segues

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSString *segueId = [segue identifier];
    
    if([segueId isEqualToString:AD_DETECTED_SEGUE]){
        UXRAdDisplayViewController *adViewController = (UXRAdDisplayViewController*)[segue destinationViewController];
        adViewController.adType = @"tide";
    }
}

@end
