import 'flutter_plugin_codelab_platform_interface.dart';

class FlutterPluginCodelab {
  Future<String?> getPlatformVersion() {
    return FlutterPluginCodelabPlatform.instance.getPlatformVersion();
  }

  Future<int?> onKeyDown(int key) async {
    return FlutterPluginCodelabPlatform.instance.onKeyDown(key);
  }

  Future<int?> onKeyUp(int key) async {
    return FlutterPluginCodelabPlatform.instance.onKeyUp(key);
  }
}
