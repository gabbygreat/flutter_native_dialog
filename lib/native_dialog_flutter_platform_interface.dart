import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'native_dialog_flutter_method_channel.dart';

abstract class NativeDialogFlutterPlatform extends PlatformInterface {
  /// Constructs a NativeDialogFlutterPlatform.
  NativeDialogFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static NativeDialogFlutterPlatform _instance =
      MethodChannelNativeDialogFlutter();

  /// The default instance of [NativeDialogFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelNativeDialogFlutter].
  static NativeDialogFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NativeDialogFlutterPlatform] when
  /// they register themselves.
  static set instance(NativeDialogFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> showTestDialog() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
