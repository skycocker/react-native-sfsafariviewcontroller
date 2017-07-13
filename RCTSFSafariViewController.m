#import "RCTSFSafariViewController.h"

@implementation RCTSFSafariViewController

@synthesize bridge = _bridge;

RCT_EXPORT_MODULE();

- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller {
  [self.bridge.eventDispatcher sendAppEventWithName:@"SFSafariViewControllerDismissed" body:nil];
}

RCT_EXPORT_METHOD(openURL:(NSString *)urlString params:(NSDictionary *)params) {
  NSURL *url = [[NSURL alloc] initWithString:urlString];

  UIViewController *rootViewController = [[[UIApplication sharedApplication] delegate] window].rootViewController;
  while(rootViewController.presentedViewController) {
    rootViewController = rootViewController.presentedViewController;
  }

  SFSafariViewController *safariViewController = [[SFSafariViewController alloc] initWithURL:url];
  UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:safariViewController];

  [navigationController setNavigationBarHidden:YES animated:NO];
  safariViewController.delegate = self;

  if ([params objectForKey:@"tintColor"]) {
    UIColor *tintColor = [RCTConvert UIColor:params[@"tintColor"]];

    if([safariViewController respondsToSelector:@selector(setPreferredControlTintColor:)]) {
      safariViewController.preferredControlTintColor = tintColor;
    } else {
      safariViewController.view.tintColor = tintColor;
    }
  }

  dispatch_async(dispatch_get_main_queue(), ^{
    [rootViewController presentViewController:navigationController animated:YES completion:^{
      [self.bridge.eventDispatcher sendDeviceEventWithName:@"SFSafariViewControllerDidLoad" body:nil];
    }];
  });
}

RCT_EXPORT_METHOD(close) {
    dispatch_async(dispatch_get_main_queue(), ^{
      UIViewController *rootViewController = [[[UIApplication sharedApplication] delegate] window].rootViewController;
      [rootViewController dismissViewControllerAnimated:YES completion:nil];
    });
}

@end
