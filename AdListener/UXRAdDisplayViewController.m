//
//  UXRAdDisplayViewController.m
//  AdListener
//
//  Created by Rex St. John on 1/4/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import "UXRAdDisplayViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "CMPopTipView.h"
#import "UIView+SimpleSizing.h"
#import "WCAlertView.h"
#import "StarRatingView.h"

@interface UXRAdDisplayViewController ()
@property(nonatomic,strong) MPMoviePlayerController *moviePlayer;
@property(nonatomic,strong) CMPopTipView *popTipView;
@end

@implementation UXRAdDisplayViewController

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
    
    if([self.adType isEqualToString:@"tide"]){
        self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL: [NSURL fileURLWithPath: [[NSBundle mainBundle]pathForResource: [NSString stringWithFormat:@"tide_commercial"] ofType:@"mp4"]]];
        self.tidePodsImageView.image = [UIImage imageNamed:@"tidePods"];
        self.questionLabel.text = @"How many pod sections are in Tide Pods?";
    } else {
        self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL: [NSURL fileURLWithPath: [[NSBundle mainBundle]pathForResource: [NSString stringWithFormat:@"twix_commercial"] ofType:@"mp4"]]];
        self.tidePodsImageView.image = [UIImage imageNamed:@"twix.jpg"];
        self.questionLabel.text = @"How many layers does a Twix bar have?";
    }
    
    self.moviePlayer.fullscreen = NO;
    self.moviePlayer.controlStyle = MPMovieControlModeHidden;
    self.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
    self.moviePlayer.view.frame = CGRectMake(0, 200, self.view.frame.size.width, 440);
    self.moviePlayer.view.center = self.view.center;
    [self.view addSubview:self.moviePlayer.view];
    [self.moviePlayer.view setFrameY:250];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didFinishMovie:)
                                                 name: MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    self.questionView.alpha = 1;
    self.tidePodsImageView.alpha = 1;
    self.moviePlayer.view.alpha = 0;
    
    // Show a pop up dialog
    self.popTipView = [[CMPopTipView alloc] initWithMessage:@"Answer this question after the video to earn points!"];
    self.popTipView.has3DStyle = NO;
    self.popTipView.backgroundColor = [UIColor lightGrayColor];
    self.popTipView.delegate = self;
    self.popTipView.hasGradientBackground = NO;
    [self.popTipView presentPointingAtView:self.questionLabel inView:self.view animated:YES];
    
    //
    StarRatingView *starView = [[StarRatingView alloc] initWithFrame:self.starView.frame
                                                           andRating:3
                                                           withLabel:YES animated:YES];
    starView.label.text = @"Rate this ad";
    starView.backgroundColor = [UIColor clearColor];
    [self.questionView addSubview:starView];
    
    //
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
 

#pragma mark - Pop up tip delegate


- (void)popTipViewWasDismissedByUser:(CMPopTipView *)popTipView{
    
}

#pragma mark - Notifications

-(void)didFinishMovie:(NSNotification*)notification{
    [UIView animateWithDuration:1.0f animations:^{
        self.moviePlayer.view.alpha = 0;
        self.questionView.alpha = 1;
        self.tidePodsImageView.alpha = 1;
    }];
}

#pragma mark - Actions

-(IBAction)replayButtonAction:(id)sender{
    
    [self.moviePlayer play];
    [UIView animateWithDuration:1.0f animations:^{
        self.moviePlayer.view.alpha = 1;
        self.questionView.alpha = 0;
        self.tidePodsImageView.alpha = 0;
    }];
}

-(IBAction)wrongButtonAction:(id)sender{
    WCAlertView *alert = [[WCAlertView alloc] initWithTitle:@"Whoops, Thats Not The Answer!"
                                                    message:@"Click the replay button to view the ad again and answer the question to recieve your award."
                                                   delegate:nil
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles: nil];
    alert.style = WCAlertViewStyleWhite;
    [alert show];
}

-(IBAction)rightButtonAction:(id)sender{
    WCAlertView *alert = [[WCAlertView alloc] initWithTitle:@"Correct!"
                                                    message:@"You just earned 4,000 points!"
                                                   delegate:self
                                          cancelButtonTitle:@"Close"
                                          otherButtonTitles:@"Ok", @"Spend Points Now", nil];
    alert.style = WCAlertViewStyleWhite;
    [alert show];
    
}

#pragma mark - UIAlertViewDelegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == alertView.cancelButtonIndex){
        
    } else if([[alertView buttonTitleAtIndex:buttonIndex] isEqualToString:@"Ok"] == YES){
        [self performSegueWithIdentifier:@"PushAdCollectionViewSegue" sender:self];
    } else if([[alertView buttonTitleAtIndex:buttonIndex] isEqualToString:@"Spend Points Now"] == YES){
        [self performSegueWithIdentifier:@"PushOffersViewSegue" sender:self];
    }
}

#pragma mark - Segues

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [self.moviePlayer stop];
}

@end
