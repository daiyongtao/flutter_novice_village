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
      backgroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white
      ),
      titleTextStyle: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.bold
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      title: Text(
        "电子木鱼",
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
      ),
      actions: [ // 右侧列表
        IconButton(
            splashRadius: 30,
            onPressed: () => _toHistory(context),
            icon: Icon(Icons.history, color: Colors.black)
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