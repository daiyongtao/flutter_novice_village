import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_novice_village/muyu/models/image_option.dart';
import 'package:flutter_novice_village/muyu/models/voice_option.dart';

class VoiceOptionPanel extends StatelessWidget {
  /// 选项模型数组
  final List<VoiceOption> options;

  /// 点击事件
  final ValueChanged<int> onSelect;

  /// 当前选择的index
  final int activeIndex;

  const VoiceOptionPanel(
      {super.key, required this.options, required this.onSelect, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    const TextStyle labelStyle = TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold);
    // 上下间距16，左右间距8
    const EdgeInsets padding = EdgeInsets.symmetric(
        horizontal: 8.0, vertical: 8.0);

    return Material(
      child: SizedBox(
        height: 300,
        child: Column(
          children: [
            Container(
              height: 46,
              alignment: Alignment.center,
              child: const Text("选择音效", style: labelStyle),
            ),
            ...List.generate(options.length, _buildByIndex)
          ],
        ),
      ),
    );
  }

  // 构建底部选择图片弹窗其中一个视图
  Widget _buildByIndex(int index) {
    bool active = (index == activeIndex);
    return ListTile(
      selected: active,
      onTap: () => onSelect(index),
      title: Text(
        options[index].name,
        style: TextStyle(color: active ? Colors.blue : Colors.black),
      ),
      trailing: IconButton(
          splashRadius: 20,
          onPressed: ()=> _tempPlay(options[index].src),
          icon: const Icon(
           Icons.record_voice_over_rounded,
           color: Colors.blue,
          )
      ),
    );
  }

  void _tempPlay(String src) async {
    AudioPool pool = await FlameAudio.createPool(src, maxPlayers: 1);
    pool.start();
  }
}

// 每一个Item 对应一个 option模型
class VoiceOptionItem extends StatelessWidget {
  final VoiceOption option;
  final bool active;

  const VoiceOptionItem({super.key, required this.option, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Text(option.name, style:  TextStyle(fontWeight: FontWeight.normal)),
          Expanded(
              child: Padding(
                child: Icon(Icons.person),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
              )
          )
        ],
      ),
    );
  }
}