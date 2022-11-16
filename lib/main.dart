import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:the_first/constants.dart';
import 'package:the_first/screen/singUp_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'The First',
        theme: My_Themes.dk,
        themeMode: ThemeMode.light,
        darkTheme: My_Themes.dk,
        home: const SingUp());
  }
}
