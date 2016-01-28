//
//  RootViewController.m
//  Vibes Alarm
//
//  Created by Aaron B on 1/19/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "RootViewController.h" 
#import <AVFoundation/AVFoundation.h>
#import "SongInformation.h"

@property UIBarButtonItem *Play;
@property UIBarButtonItem *Stop;
@property UITextField *audioInfo;
@property NSString *audioTrackName;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *songNames;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *stringWithFilePath = [[NSBundle mainBundle] pathsForResourcesOfType:@"wav" inDirectory:@"Sounds"];
    NSString *songName = [[stringWithFilePath objectAtIndex:0] lastPathComponent];
    [self.songNames addObject:songName];
    
    NSArray * arr = [songName componentsSeparatedByString:@" "];
    NSString *newString = [arr lastObject];
    NSLog(@"Array values are : %@",arr);
    NSLog(@"%@", newString);
    
//    NSString *songTitle = @"slowcial.wav";

//    NSString *path = [NSString stringWithFormat:@"%@/%@", songTitle, [[NSBundle mainBundle] resourcePath]];
//    NSURL *soundUrl = [NSURL fileURLWithPath:path];
//    
//    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
//    
    UIBarButtonItem *buttonPlay = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(playButtonTapped:)];
    
    UIBarButtonItem *buttonStop = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(stopButtonTapped:)];
    self.Play = buttonPlay;
    self.Stop = buttonStop;
    self.navigationItem.leftBarButtonItem = self.Play;
    self.navigationItem.rightBarButtonItem = self.Stop;
}

- (void)playButtonTapped:(UIBarButtonItem *)sender {
//    [_audioPlayer play];
}

- (void)stopButtonTapped:(UIBarButtonItem *)sender {
//    [_audioPlayer stop];
}

#pragma Mark - TableView Methods

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell Identifier"];
    SongInformation *currentSong = self.songNames[indexPath.row];
    cell.textLabel.text = currentSong.songName;
    return cell;
                                                  
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.songNames.count;
    
}

- (NSMutableArray *) songTitleWithOutPath:(NSArray *) arrayWithFolderPath {
    NSMutableArray *newArr = [[NSMutableArray alloc] init];
    for (NSString *filePath in arrayWithFolderPath){
       [newArr addObject:[filePath lastPathComponent]];
    }
    return newArr;
}

@end
