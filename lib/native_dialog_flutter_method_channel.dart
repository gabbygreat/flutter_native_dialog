import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'native_dialog_flutter_platform_interface.dart';

/// An implementation of [NativeDialogFlutterPlatform] that uses method channels.
class MethodChannelNativeDialogFlutter extends NativeDialogFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('native_dialog_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> showTestDialog() async {
    methodChannel.invokeMethod('showTestDialog');
  }
}
