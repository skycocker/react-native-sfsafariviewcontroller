#import <React/RCTBridgeModule.h>
#import <React/RCTConvert.h>
#import <React/RCTEventDispatcher.h>
#import <UIKit/UIKit.h>

@import SafariServices;

@interface RCTSFSafariViewController : NSObject <RCTBridgeModule, SFSafariViewControllerDelegate>
@end
