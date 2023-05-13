import 'native_dialog_flutter_platform_interface.dart';

class NativeDialogFlutter {
  Future<String?> getPlatformVersion() {
    return NativeDialogFlutterPlatform.instance.getPlatformVersion();
  }

  Future<void> showTestDialog() {
    return NativeDialogFlutterPlatform.instance.showTestDialog();
  }
}
