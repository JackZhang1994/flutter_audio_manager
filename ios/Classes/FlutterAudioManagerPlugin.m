#import "FlutterAudioManagerPlugin.h"
#import <AVFoundation/AVFoundation.h>

@implementation FlutterAudioManagerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_audio_manager_plugin"
            binaryMessenger:[registrar messenger]];
  FlutterAudioManagerPlugin* instance = [[FlutterAudioManagerPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([call.method isEqualToString:@"requestAudioFocus"]) {
         [self pauseBackgroundSoundWithError:nil];
        result(@"暂停");
    } else {
    result(FlutterMethodNotImplemented);
  }
}

//暂停后台背景音乐的播放，激活当前应用的audio
- (void)pauseBackgroundSoundWithError:(NSError **)error {
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayback withOptions: AVAudioSessionCategoryOptionAllowBluetooth error:error];
    [session setActive:YES error:error];
}

@end
