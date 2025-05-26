
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConformDailog extends StatelessWidget {
  final String title;
  final String msg;
  final String conformText;
  final VoidCallback onConform;

  const ConformDailog({
    super.key,
    required this.title,
    required this.msg,
    this.conformText = "删除",
    required this.onConform});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildTitle(),
            _buildContent(),
            _buildButtons(context)
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Center(
      child: Wrap(
          spacing: 8,
          direction: Axis.horizontal,
          children: [
            Icon(Icons.error_rounded, color: Colors.yellow),
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
          ]
      ),
    );
  }

  Widget _buildContent() {
    return Wrap(
        spacing: 16,
        direction: Axis.vertical,
        children: [
          Spacer(),
          Text(msg, style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
          Spacer()
        ]
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Align( // 布局右下角
        alignment: Alignment.bottomRight,
        child:  Wrap(
          spacing: 8,
          direction: Axis.horizontal,
          children: [
            _buildBorderTextButton("取消", Colors.grey, Colors.grey, Colors.white, () => _cancel(context)),
            _buildBorderTextButton("确定", Colors.red, Colors.white, Colors.red, onConform)
          ],
        )
    );
  }

  void _cancel(BuildContext context) {
    Navigator.pop(context);
  }

  Widget _buildBorderTextButton(String title, Color color, Color textColor, Color bgColor, VoidCallback callBack) {

    return Container(
        height: 40,
        // color: color,
        // padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          // color: bgColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.fromBorderSide(BorderSide(color: color, width: 1)),
        ),
        child: TextButton(
          onPressed: callBack,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(bgColor), // 设置按钮的背景颜色
            foregroundColor: MaterialStateProperty.all<Color>(textColor), // 设置按钮文本和图标的颜色
          ),
          child: Text(title, style: TextStyle(fontSize: 14, color: textColor))
        )
    );
  }
}