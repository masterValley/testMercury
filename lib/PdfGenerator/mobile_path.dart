import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

Future<void> saveAndLaunchFile (List<int> bytes, String filename) async {
  Directory path = (await getApplicationDocumentsDirectory());
  String pathFile = path.path;
  final file = File('$pathFile/$filename');
  await file.writeAsBytes(bytes, flush: true);
  OpenFile.open('$pathFile/$filename');
}