//
//  UXRMoviePlayerController.m
//  AdListener
//
//  Created by Rex St. John on 1/3/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import "UXRMoviePlayerViewController.h"

@implementation UXRMoviePlayerViewController

/*
 videoPlayer= [[MPMoviePlayerController alloc] initWithContentURL: [NSURL fileURLWithPath: [[NSBundle mainBundle]pathForResource: [NSString stringWithFormat:@"introIpad"] ofType:@"mp4"]]];
 
 videoPlayer.fullscreen = YES;
 videoPlayer.movieSourceType = MPMovieSourceTypeFile;
 videoPlayer.view.frame = self.view.bounds;
 [self.view addSubview:videoPlayer.view];
 [videoPlayer play];
 
 
 NSURL *videoURL = [NSURL URLWithString:[[[[self.campArray objectAtIndex:button.tag]valueForKey:@"images"]objectAtIndex:0]valueForKey:@"imageURL"]];
 self.moviePlayer = [[MPMoviePlayerViewController alloc] initWithContentURL:videoURL];
 self.moviePlayer.moviePlayer.shouldAutoplay=YES;
 [self presentModalViewController:self.moviePlayer animated:YES];
 [self.moviePlayer.moviePlayer play];
 */
@end
