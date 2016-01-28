//
//  RootViewController.m
//  SelfieSticker
//
//  Created by Aaron B on 1/21/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "RootViewController.h"
#import "Sticker.h"

@interface RootViewController ()
@property Sticker *stickerView;
@end

@implementation RootViewController
- (IBAction)addImage:(UIButton *)sender {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.stickerView = [[Sticker alloc] initWithImage:[UIImage imageNamed:@"glasses"]];
    [self.view addSubview:self.stickerView];
    self.stickerView.center = self.view.center;
}

@end
