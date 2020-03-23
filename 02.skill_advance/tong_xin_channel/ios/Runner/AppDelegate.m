#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];
    // Override point for customization after application launch.
    
    static NSString * const METHOD_CHANNEL = @"com.zhunjiee.flutter/android";
    static NSString * const METHOD_CHANNEL_ADD = @"numberAdd";
    
    FlutterViewController *controller = (FlutterViewController *)self.window.rootViewController;
    FlutterMethodChannel *methodChannel =[FlutterMethodChannel methodChannelWithName:METHOD_CHANNEL binaryMessenger:controller.binaryMessenger];
    [methodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([call.method isEqualToString:METHOD_CHANNEL_ADD]) {
            NSDictionary *dict = call.arguments;
            NSInteger num1 = [[dict objectForKey:@"num1"] integerValue];
            NSInteger num2 = [dict[@"num2"] integerValue];
            NSInteger sum = num1 + num2;
            result(@(sum));
        }
    }];
    
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
