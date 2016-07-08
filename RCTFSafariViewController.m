#import "RCTSFSafariViewController.h"

@implementation RCTSFSafariViewController

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(openURL:(NSString *)urlString) {
  NSURL *url = [[NSURL alloc] initWithString:urlString];
  
  UIViewController *rootViewController = [[UIApplication sharedApplication] keyWindow].rootViewController;
  SFSafariViewController *safariViewController = [[SFSafariViewController alloc] initWithURL:url];
  UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:safariViewController];
  
  [navigationController setNavigationBarHidden:YES animated:NO];
  safariViewController.delegate = self;
  
  dispatch_async(dispatch_get_main_queue(), ^{
    [rootViewController presentViewController:navigationController animated:YES completion:nil];
  });
}


@end