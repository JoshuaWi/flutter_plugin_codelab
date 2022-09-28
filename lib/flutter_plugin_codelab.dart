
import 'flutter_plugin_codelab_platform_interface.dart';

class FlutterPluginCodelab {
  Future<String?> getPlatformVersion() {
    return FlutterPluginCodelabPlatform.instance.getPlatformVersion();
  }
}
