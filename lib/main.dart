import 'package:flutter/material.dart';
import 'guess/guess_page.dart';
import 'counter/counter_page.dart';
import 'muyu/muyu_page.dart';

void main() {
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
      ),
      // home: const GuessPage(title: '猜数字'),
      home: const MuyuPage(),
    );
  }
}
