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
    
    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL: [NSURL fileURLWithPath: [[NSBundle mainBundle]pathForResource: [NSString stringWithFormat:@"tide_commercial"] ofType:@"mp4"]]];
    
    self.moviePlayer.fullscreen = NO;
    self.moviePlayer.controlStyle = MPMovieControlStyleNone;
    self.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
    self.moviePlayer.view.frame = CGRectMake(0, 200, self.view.frame.size.width, 440);
    self.moviePlayer.view.center = self.view.center;
    [self.view addSubview:self.moviePlayer.view];
    [self.moviePlayer.view setFrameY:250];
    [self.moviePlayer play];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didFinishMovie:)
                                                 name: MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    self.questionView.alpha = 0;
    self.tidePodsImageView.alpha = 0;
    
    // Show a pop up dialog
    self.popTipView = [[CMPopTipView alloc] initWithMessage:@"Answer this question after the video to earn points!"];
    self.popTipView.has3DStyle = NO;
    self.popTipView.backgroundColor = [UIColor lightGrayColor];
    self.popTipView.delegate = self;
    self.popTipView.hasGradientBackground = NO;
    [self.popTipView presentPointingAtView:self.questionLabel inView:self.view animated:YES];
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
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles: nil];
    alert.style = WCAlertViewStyleWhite;
    [alert show];
}

-(IBAction)rightButtonAction:(id)sender{
    WCAlertView *alert = [[WCAlertView alloc] initWithTitle:@"Correct!"
                                                    message:@"You just earned 4,000 points!"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Ok", "Spend Points Now", nil];
    alert.style = WCAlertViewStyleWhite;
    [alert show];
    
}

#pragma mark - UIAlertViewDelegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == alertView.cancelButtonIndex){
        
    } else{
        [self performSegueWithIdentifier:@"PushAdCollectionViewSegue" sender:self];
    }
}

#pragma mark - Segues

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [self.moviePlayer stop];
}

@end
