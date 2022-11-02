import 'package:get_storage/get_storage.dart';

import 'imports.dart';
import 'src/dependece/dependeces.dart' as dependece;

void main() async {
  dependece.init();
  await GetStorage.init();
  runApp(const AppWidget());
}
