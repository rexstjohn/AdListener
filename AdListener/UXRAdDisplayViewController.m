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
    self.moviePlayer.view.frame = CGRectMake(0, 200, self.view.frame.size.width, 450);
    [self.view addSubview:self.moviePlayer.view];
    [self.moviePlayer play];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
