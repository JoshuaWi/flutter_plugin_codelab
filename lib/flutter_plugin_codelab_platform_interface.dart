import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_plugin_codelab_method_channel.dart';

abstract class FlutterPluginCodelabPlatform extends PlatformInterface {
  /// Constructs a FlutterPluginCodelabPlatform.
  FlutterPluginCodelabPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterPluginCodelabPlatform _instance = MethodChannelFlutterPluginCodelab();

  /// The default instance of [FlutterPluginCodelabPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterPluginCodelab].
  static FlutterPluginCodelabPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterPluginCodelabPlatform] when
  /// they register themselves.
  static set instance(FlutterPluginCodelabPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
