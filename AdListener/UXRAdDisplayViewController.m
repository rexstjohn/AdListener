//
//  UXRAdDisplayViewController.m
//  AdListener
//
//  Created by Rex St. John on 1/4/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import "UXRAdDisplayViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface UXRAdDisplayViewController ()
@property(nonatomic,strong) MPMoviePlayerController *moviePlayer;
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
    [self.moviePlayer play];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didFinishMovie:)
                                                 name: MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    self.questionView.alpha = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Notifications

-(void)didFinishMovie:(NSNotification*)notification{
    [UIView animateWithDuration:1.0f animations:^{
        self.moviePlayer.view.alpha = 0;
        self.questionView.alpha = 1;
    }];
}

#pragma mark - Actions

-(IBAction)replayButtonAction:(id)sender{
    
    [self.moviePlayer play];
    [UIView animateWithDuration:1.0f animations:^{
        self.moviePlayer.view.alpha = 1;
        self.questionView.alpha = 0;
    }];
}

-(IBAction)wrongButtonAction:(id)sender{
    
}

-(IBAction)rightButtonAction:(id)sender{
    
}

@end
