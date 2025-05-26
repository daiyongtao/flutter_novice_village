import 'package:flutter/material.dart';
import 'package:flutter_novice_village/muyu/history/merit_record.dart';
import 'package:intl/intl.dart';

DateFormat _dateFormat = DateFormat('yyyy年MM月dd日 HH:mm:ss');

// 功德记录item
class MeritRecordItem extends StatelessWidget {
  final MeritRecord record;

  const MeritRecordItem({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    // 将时间戳格式化成字符串
    String dateString = _dateFormat.format(DateTime.fromMillisecondsSinceEpoch(record.timestamp));
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        backgroundImage: AssetImage(record.image),
      ),
      title: Text("功德 +${record.value}"),
      subtitle: Text(record.voiceName),
      trailing: Text(
        dateString,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
    );
  }
}