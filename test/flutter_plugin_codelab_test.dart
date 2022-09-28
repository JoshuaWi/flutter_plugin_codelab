import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_plugin_codelab/flutter_plugin_codelab.dart';
import 'package:flutter_plugin_codelab/flutter_plugin_codelab_platform_interface.dart';
import 'package:flutter_plugin_codelab/flutter_plugin_codelab_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterPluginCodelabPlatform
    with MockPlatformInterfaceMixin
    implements FlutterPluginCodelabPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterPluginCodelabPlatform initialPlatform = FlutterPluginCodelabPlatform.instance;

  test('$MethodChannelFlutterPluginCodelab is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterPluginCodelab>());
  });

  test('getPlatformVersion', () async {
    FlutterPluginCodelab flutterPluginCodelabPlugin = FlutterPluginCodelab();
    MockFlutterPluginCodelabPlatform fakePlatform = MockFlutterPluginCodelabPlatform();
    FlutterPluginCodelabPlatform.instance = fakePlatform;

    expect(await flutterPluginCodelabPlugin.getPlatformVersion(), '42');
  });
}
