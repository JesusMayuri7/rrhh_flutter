import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:path_provider_windows/path_provider_windows.dart';

///To save the Excel file in the device
class FileSaveHelper {
  static const MethodChannel _platformCall = MethodChannel('launchFile');

  static Future<void> saveAndLaunchFile(
      List<int> bytes, String fileName) async {
    Directory? directory;
    String? path;
    if (Platform.isAndroid || Platform.isIOS || Platform.isLinux) {
      directory = await getApplicationSupportDirectory();
      path = directory.path;
    } else if (Platform.isWindows) {
      final PathProviderWindows provider = PathProviderWindows();
      path = await provider.getApplicationDocumentsPath();
    } else {
      path = await PathProviderPlatform.instance.getApplicationSupportPath();
    }
    final File file =
        File(Platform.isWindows ? '$path\\$fileName' : '$path/$fileName');
    await file.writeAsBytes(bytes, flush: true);
    if (Platform.isAndroid || Platform.isIOS) {
      final Map<String, String> argument = <String, String>{
        'file_path': '$path/$fileName'
      };
      try {
        //ignore: unused_local_variable
        final Future<Map<String, String>?> result =
            _platformCall.invokeMethod('viewExcel', argument);
      } catch (e) {
        throw Exception(e);
      }
    } else if (Platform.isWindows) {
      await Process.run('start', ['$path\\$fileName'], runInShell: true);
    } else if (Platform.isMacOS) {
      await Process.run('open', ['$path/$fileName'], runInShell: true);
    } else if (Platform.isLinux) {
      await Process.run('xdg-open', ['$path/$fileName'], runInShell: true);
    }
  }
}
