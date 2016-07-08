#import "RCTBridgeModule.h"
#import "RCTConvert.h"
#import "RCTEventDispatcher.h"
#import <UIKit/UIKit.h>

@import SafariServices;

@interface RCTSFSafariViewController : NSObject <RCTBridgeModule, SFSafariViewControllerDelegate>
@end