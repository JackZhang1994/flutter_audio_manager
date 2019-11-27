package com.jvtd.flutter_audio_manager_plugin;

import android.content.Context;
import android.media.AudioManager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * FlutterAudioManagerPlugin
 */
public class FlutterAudioManagerPlugin implements MethodCallHandler
{
  private static Registrar reg;

  /**
   * Plugin registration.
   */
  public static void registerWith(Registrar registrar)
  {
    reg = registrar;
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_audio_manager_plugin");
    channel.setMethodCallHandler(new FlutterAudioManagerPlugin());
  }

  @Override
  public void onMethodCall(MethodCall call, Result result)
  {
    if (call.method.equals("requestAudioFocus"))
    {
      AudioManager audioManager = (AudioManager) reg.activeContext().getApplicationContext().getSystemService(
              Context.AUDIO_SERVICE);
      audioManager.requestAudioFocus(null,
              AudioManager.STREAM_MUSIC,
              AudioManager.AUDIOFOCUS_GAIN_TRANSIENT);
      result.success(1);
    } else
    {
      result.notImplemented();
    }
  }
}
