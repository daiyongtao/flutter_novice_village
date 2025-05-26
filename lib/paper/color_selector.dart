
import 'package:flutter/material.dart';

// 线条颜色选择器
class ColorSelector extends StatelessWidget {
  final List<Color> supportColors; // 支持的颜色列表
  final int index;
  final ValueChanged<int> onSelect;

  const ColorSelector({
    super.key,
    required this.supportColors,
    this.index = 0,
    required this.onSelect
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Wrap(
        direction: Axis.horizontal,
        children: List.generate(supportColors.length, _buildByIndex)
      )
    );
  }

  Widget _buildByIndex(int index) {
    bool select = (index == this.index);
    return GestureDetector(
      onTap: () => onSelect(index),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        width: 30,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: select ? Border.all(color: Colors.blue) : null
        ),
        child: CircleAvatar(
            radius: 12,
            backgroundColor: supportColors[index]
        ),
      ),
    );
  }
}