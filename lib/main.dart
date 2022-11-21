import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:the_first/auth/auth_bindings.dart';
import 'package:the_first/shared/utils/app_theme.dart';
import 'package:the_first/view/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The First',
      theme: AppThemes.lt,
      getPages: const [],
      initialBinding: AuthBindings(),
      themeMode: ThemeMode.light,
      darkTheme: AppThemes.dk,
      home: SplashScreen(),
    );
  }
}
