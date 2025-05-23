import 'package:flutter/material.dart';

// 可以通过自定义一个class，也可以通过函数直接返回一个Stack
/*自定义view：背景颜色 + 中间大文字*/
class ResultNotice extends StatelessWidget {
  final String info;
  final Color color;
  const ResultNotice({super.key, required this.info, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
        alignment: Alignment.center,
        color: color,
        child: Text(
          info,
          style: TextStyle(
              fontSize: 50,
              color: Colors.white
          ),
        )
    ));

    // 也上面效果一致，需要外部再包一层Expanded
    return Stack(
      children: [
        Container(color: color),
        Center(
            child:  Text(
              info,
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.white
              ),
            )
        )
      ],
    );
  }
}

// 通过函数返回一个widget，和下面自定义ResultNotice效果一样
Widget _buildResultNotice(Color color, String info) {
  return Expanded(child: Container(
      alignment: Alignment.center,
      color: color,
      child: Text(
        info,
        style: TextStyle(
            fontSize: 50,
            color: Colors.white
        ),
      )
  ));
}