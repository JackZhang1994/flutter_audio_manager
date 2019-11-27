import 'dart:async';

import 'package:flutter/services.dart';

class FlutterAudioManagerPlugin {
  static const MethodChannel _channel =
      const MethodChannel('flutter_audio_manager_plugin');

  static Future<int> get requestAudioFocus async {
    return _channel.invokeMethod('requestAudioFocus');
  }
}
