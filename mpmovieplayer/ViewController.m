//
//  ViewController.m
//  mpmovieplayer
//
//  Created by saifuddin on 14/01/13.
//  Copyright (c) 2013 Brainstorm Technologies Sdn Bhd. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()
@property MPMoviePlayerController *player;
@end

@implementation ViewController
@synthesize player;
- (void)viewDidLoad
{
    [super viewDidLoad];
	
	NSString *filepath   =   [[NSBundle mainBundle] pathForResource:@"Movie" ofType:@"m4v"];
	NSURL    *url    =   [NSURL fileURLWithPath:filepath];
	
	//part 1
	player = [[MPMoviePlayerController alloc] initWithContentURL: url];
	[player.view setFrame: CGRectMake(0, 0, 100, 100)];
	//[player prepareToPlay];
	//[player setShouldAutoplay:YES];
	//[player setControlStyle:2];
	[[NSNotificationCenter defaultCenter]
	 addObserver:self
	 selector:@selector(movieLoadStateDidChange:)
	 name:MPMoviePlayerLoadStateDidChangeNotification
	 object:player];
	[player play];
}

-(void)movieLoadStateDidChange: (NSNotification*)notification
{
    if (player.loadState)
	{
        [[NSNotificationCenter defaultCenter]
		 removeObserver:self
		 name:MPMoviePlayerLoadStateDidChangeNotification
		 object:player] ;
        [self.view addSubview:player.view];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
