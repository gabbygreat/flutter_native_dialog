import 'package:flutter_test/flutter_test.dart';
import 'package:native_dialog_flutter/native_dialog_flutter.dart';
import 'package:native_dialog_flutter/native_dialog_flutter_platform_interface.dart';
import 'package:native_dialog_flutter/native_dialog_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNativeDialogFlutterPlatform
    with MockPlatformInterfaceMixin
    implements NativeDialogFlutterPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> showTestDialog() => Future.value();
}

void main() {
  final NativeDialogFlutterPlatform initialPlatform =
      NativeDialogFlutterPlatform.instance;

  test('$MethodChannelNativeDialogFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNativeDialogFlutter>());
  });

  test('getPlatformVersion', () async {
    NativeDialogFlutter nativeDialogFlutterPlugin = NativeDialogFlutter();
    MockNativeDialogFlutterPlatform fakePlatform =
        MockNativeDialogFlutterPlatform();
    NativeDialogFlutterPlatform.instance = fakePlatform;

    expect(await nativeDialogFlutterPlugin.getPlatformVersion(), '42');
  });
}
