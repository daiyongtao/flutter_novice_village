import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_novice_village/app_navigation.dart';
import 'package:flutter_novice_village/storage/db_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbStorage.instance.open(); // 打开数据库
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.white
          ),
          titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),
        )
      ),
      home: AppNavigation()
    );
  }
}
