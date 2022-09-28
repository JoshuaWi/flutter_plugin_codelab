import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_plugin_codelab_platform_interface.dart';

/// An implementation of [FlutterPluginCodelabPlatform] that uses method channels.
class MethodChannelFlutterPluginCodelab extends FlutterPluginCodelabPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_plugin_codelab');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<int?> onKeyDown(int key) async {
    final int? numNotesOn =
        await methodChannel.invokeMethod('onKeyDown', [key]);
    return numNotesOn;
  }

  @override
  Future<int?> onKeyUp(int key) async {
    final int? numNotesOn = await methodChannel.invokeMethod('onKeyUp', [key]);
    return numNotesOn;
  }
}
