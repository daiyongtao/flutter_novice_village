
// 单例
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

const String kGuessSpKey = 'guess-config';
const String kMuYUSpKey = 'muyu-config';

class SpStorage {
  SpStorage._();
  
  static SpStorage? _storage;
  
  static SpStorage get instance {
    _storage = _storage ?? SpStorage._();
    return _storage!;
  }
  
  SharedPreferences? _sp;

  /// 初始化sp单例
  Future<void> initSpWhenNull() async {
    if (_sp != null) return;
    _sp = _sp ?? await SharedPreferences.getInstance();
  }

  /// 保存猜数字游戏数据
  /// guessing: 是否正在游戏中
  /// value: 待猜测的数字
  Future<bool> saveGuessConfig(bool guessing, int value) async {
    await initSpWhenNull();
    // 将游戏数据dict转成字符串保存起来
    String content = json.encode({'guessing': guessing, 'value': value});
    return _sp!.setString(kGuessSpKey, content);
  }

  /// 读取猜数字游戏数据
  Future<({bool guessing, int value})> readGuessConfig() async {
    await initSpWhenNull();
    String content = _sp!.get(kGuessSpKey) as String;
    Map<String, dynamic> dict = json.decode(content);
    ({bool guessing, int value}) guessConfig = (guessing: dict['guessing'], value: dict['value']);
    return guessConfig;
  }

  /// 存储电子木鱼配置的信息
  /// counter: 功德总数
  /// imageIndex: 当前图片索引index
  /// voiceIndex: 当前声音索引index
  Future<bool> saveMuyuConfig(int counter, int imageIndex, int voiceIndex) async {
    await initSpWhenNull();
    String content = json.encode({
      'counter': counter,
      'imageIndex': imageIndex,
      'voiceIndex': voiceIndex
    });
    return _sp!.setString(kMuYUSpKey, content);
  }

  /// 读取电子木鱼数据
  Future<({int counter, int imageIndex, int voiceIndex})> readMuyuConfig() async {
    await initSpWhenNull();
    String content = _sp!.get(kMuYUSpKey) as String;
    Map<String, dynamic> dict = json.decode(content);
    ({int counter, int imageIndex, int voiceIndex}) config;
    config = (counter: dict['counter'], imageIndex: dict['imageIndex'], voiceIndex: dict['voiceIndex']);
    return config;
  }
}