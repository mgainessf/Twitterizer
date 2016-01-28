//
//  WikiVC.m
//  Week Two Assessment
//
//  Created by Aaron B on 1/22/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "WikiVC.h"
#import "DetailsVC.h"

@interface WikiVC () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WikiVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.selectedPark.wikiPage]];
    self.webView.delegate = self;


}
- (IBAction)dismissButtonPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:
     nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    DetailsVC *destination  = segue.destinationViewController;
    destination.selectedPark = self.selectedPark;
}

@end
