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
  // 随机数数值
  int _value = 0;
  // 是否在游戏过程中 (当 _guessing 为 false 时，支持点击，按钮呈蓝色；为 true 时，禁止点击，按钮呈灰色：)
  bool _guessing = false;

  void _generateRandomValue() {
    setState(() {
      _value = _random.nextInt(100); //  0~99 之间的随机整数
      _guessing = true; // 点击按钮时，表示游戏开始
    });
  }

  TextEditingController _guessCtrl = TextEditingController();
  void _oncheck() {
    print("哈哈 =====目标数值:$_value======");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GuessAppBar(onCheck: _oncheck, textEditingController: _guessCtrl),
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
                if (!_guessing) const Text('点击生成随机数值'),
                Text(
                  _guessing ? "**" : '$_value',
                  style: const TextStyle(fontSize: 68, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _guessing ? null : _generateRandomValue,
        backgroundColor: _guessing ? Colors.grey : Colors.cyan,
        tooltip: 'Increment',
        child: const Icon(
          Icons.generating_tokens_outlined,
          color: Colors.white,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    _guessCtrl.dispose();
    super.dispose();
  }
}