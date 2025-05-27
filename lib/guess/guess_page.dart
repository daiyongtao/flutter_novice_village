// 猜数字游戏
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_novice_village/guess/result_notice.dart';
import 'package:flutter_novice_village/guess/guess_app_bar.dart';
import 'package:flutter_novice_village/sp_storage.dart';

// 用于生成随机数
Random _random = Random();

class GuessPage extends StatefulWidget {
  const GuessPage({super.key});

  @override
  State<GuessPage> createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> with AutomaticKeepAliveClientMixin {
  // 随机数数值
  int _value = 0;
  // 是否在游戏过程中 (当 _guessing 为 false 时，支持点击，按钮呈蓝色；为 true 时，禁止点击，按钮呈灰色：)
  bool _guessing = false;
  // null：相等， true：大了，false：小了
  bool? _isBig;

  @override
  bool get wantKeepAlive => true;

  void _generateRandomValue() {
    setState(() {
      _value = _random.nextInt(100); //  0~99 之间的随机整数
      _guessing = true; // 点击按钮时，表示游戏开始
      SpStorage.instance.saveGuessConfig(_guessing, _value);
      _isBig = null;
    });
  }

  TextEditingController _guessCtrl = TextEditingController();
  void _oncheck() {
    print("哈哈 =====目标数值:$_value======, ${_guessCtrl.text}=======");

    int? guessValue = int.tryParse(_guessCtrl.text);

    // 游戏未开始，或者 输入的text不是整数
    if (guessValue == null || !_guessing) return;

    // 猜对了，游戏结束
    if (guessValue == _value) {
      setState(() {
        _isBig = null;
        _guessing = false;
        // 如果猜对了，游戏结束，再更新以下存储数据
        SpStorage.instance.saveGuessConfig(_guessing, 0);
      });
      return;
    }

    // 猜错了
    setState(() {
      _isBig = guessValue > _value;
    });
  }

  @override
  void initState() {
    super.initState();
    _initConfig();
  }

  void _initConfig() async {
    ({bool guessing, int value}) config = await SpStorage.instance.readGuessConfig();
    _guessing = config.guessing;
    _value = config.value;
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GuessAppBar(onCheck: _oncheck, textEditingController: _guessCtrl),
      body: Stack(
        children: [
          if (_isBig != null)
            Column(
            children: [
              if (_isBig!)
              ResultNotice(info: "大了", color: Colors.redAccent),
              Spacer(),
              if (!_isBig!)
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