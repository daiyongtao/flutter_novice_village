import 'package:flutter/material.dart';

// 回退、撤销回退
class BackUpButtons extends StatelessWidget {
  final VoidCallback? onBack; // 回退
  final VoidCallback? onRevocation; // 撤销回退

  const BackUpButtons({
    super.key,
    required this.onBack,
    required this.onRevocation
  });

  @override
  Widget build(BuildContext context) {
    const BoxConstraints cts = BoxConstraints(minHeight: 32, minWidth: 32);
    return Center(
      child: Wrap(
        direction: Axis.horizontal,
        children: [
          Transform.scale(
            scaleX: -1, // X 轴对称调换图片
            child: IconButton(
              splashRadius: 20,
              constraints: cts,
              onPressed: onBack,
              icon: Icon(Icons.next_plan_outlined),
            ),
          ),
          IconButton(
            splashRadius: 20,
            constraints: cts,
            onPressed: onRevocation,
            icon: Icon(Icons.next_plan_outlined),
          )
        ],
      ),
    );
  }
}