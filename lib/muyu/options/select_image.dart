import 'package:flutter/material.dart';
import 'package:flutter_novice_village/muyu/models/image_option.dart';

class ImageOptionPanel extends StatelessWidget {
  /// 选项模型数组
  final List<ImageOption> options;

  /// 点击事件
  final ValueChanged<int> onSelect;

  /// 当前选择的index
  final int activeIndex;

  const ImageOptionPanel(
      {super.key, required this.options, required this.onSelect, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    const TextStyle labelStyle = TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold);
    // 上下间距16，左右间距8
    const EdgeInsets padding = EdgeInsets.symmetric(
        horizontal: 8.0, vertical: 16.0);

    return Material(
      child: SizedBox(
        height: 300,
        child: Column(
          children: [
            Container(
              height: 46,
              alignment: Alignment.center,
              child: const Text("选择木鱼", style: labelStyle),
            ),
            Expanded(
                child: Padding(
                  padding: padding,
                  child: Row(
                    children: [
                      _buildByIndex(0),
                      const SizedBox(width: 10),
                      _buildByIndex(1),
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

  // 构建底部选择图片弹窗其中一个视图
  Widget _buildByIndex(int index) {
    bool active = (index == activeIndex);
    return GestureDetector(
      onTap: () => onSelect(index),
      child: ImageOptionItem(option: options[index], active: active),
    );
  }
}

// 每一个Item 对应一个 option模型
class ImageOptionItem extends StatelessWidget {
  final ImageOption option;
  final bool active;

  const ImageOptionItem({super.key, required this.option, required this.active});

  @override
  Widget build(BuildContext context) {
    const Border activeBorder = Border.fromBorderSide(BorderSide(color: Colors.blue));

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: active ? activeBorder : null
      ),
      child: Column(
        children: [
          Text(option.name, style:  TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Image.asset(option.src),
              )
          ),
          Text("每次功德 +${option.min}~${option.max}",
            style: const TextStyle(color: Colors.grey, fontSize: 12))
        ],
      ),
    );
  }
}