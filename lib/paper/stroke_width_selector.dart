import 'package:flutter/material.dart';

// 线条粗细选择器
class StrokeWidthSelector extends StatelessWidget {
  final List<double> supportStrokeWidths; // 支持的线宽列表
  final int index;
  final Color color;
  final ValueChanged<int> onSelect;

  const StrokeWidthSelector({
    super.key,
    required this.supportStrokeWidths,
    this.index = 0,
    required this.color,
    required this.onSelect
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(supportStrokeWidths.length, _buildByIndex)
      ),
    );
  }

  Widget _buildByIndex(int index) {
    bool select = (index == this.index);
    return GestureDetector(
      onTap: () => onSelect(index),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        width: 70,
        height: 18,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: select ? Border.all(color: Colors.blue) : null
        ),
        child: Container(
          width: 50,
          color: color,
          height: supportStrokeWidths[index]
        ),
      ),
    );
  }
}