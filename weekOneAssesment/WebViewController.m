//
//  WebViewController.m
//  weekOneAssesment
//
//  Created by Aaron B on 1/15/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "WebViewController.h"


@interface WebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
    [self loadURL:@"http://www.mobilemakers.co"];
    self.navBar.title = [NSString stringWithFormat:@"%i", self.navigationTitle];
    
}

//Sets the load URL Addy

- (void) loadURL: (NSString *) urlString {
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
}

//WEB VIEW LOAD, LOADING AND FAIL MEHTODS

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"%@", error.description);
    [self.activityIndicator stopAnimating];

}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    [self.activityIndicator startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.activityIndicator stopAnimating];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
