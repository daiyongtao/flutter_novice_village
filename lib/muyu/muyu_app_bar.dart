import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_novice_village/muyu/history/merit_record.dart';
import 'package:flutter_novice_village/muyu/history/merit_records_page.dart';

/*电子木鱼导航栏*/
class MuyuAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List records;

  const MuyuAppBar({super.key, required this.records});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("电子木鱼"),
      actions: [ // 右侧列表
        IconButton(
            splashRadius: 30,
            onPressed: () => _toHistory(context),
            icon: Icon(Icons.history)
        )
      ],
    );
  }

  void _toHistory(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (_) => MeritRecordsPage(records: records.reversed.toList() as List<MeritRecord>),
      )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}