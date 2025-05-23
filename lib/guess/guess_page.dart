// 猜数字游戏
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_novice_village/guess/result_notice.dart';
import 'package:flutter_novice_village/guess/guess_app_bar.dart';

// 用于生成随机数
Random _random = Random();

class GuessPage extends StatefulWidget {
  const GuessPage({super.key, required this.title});
  final String title;

  @override
  State<GuessPage> createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  int _value = 0;
  bool _guessing = false;

  void _generateRandomValue() {
    setState(() {
      _value = _random.nextInt(100); //  0~99 之间的随机整数
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GuessAppBar(),
      body: Stack(
        children: [
          Column(
            children: [
              ResultNotice(info: "大了", color: Colors.redAccent),
              ResultNotice(info: "小了", color: Colors.blueAccent)
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('点击生成随机数值',),
                Text(
                  '$_value',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _generateRandomValue,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}