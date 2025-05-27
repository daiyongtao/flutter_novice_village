import 'package:flutter/material.dart';
import 'package:flutter_novice_village/muyu/history/merit_record_item.dart';
import 'merit_record.dart';

// 功德记录页
class MeritRecordsPage extends StatefulWidget {
  final List<MeritRecord> records;

  const MeritRecordsPage({super.key, required this.records});

  @override
  State<MeritRecordsPage> createState() => _MeritRecordsPageState();
}

class _MeritRecordsPageState extends State<MeritRecordsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView.builder(
        itemBuilder: _buildItem,
        itemCount: widget.records.length,
      )
    );
  }

  /// 列表item build工具
  Widget _buildItem(BuildContext context, int index) {
    MeritRecord record = widget.records[index];
    return MeritRecordItem(record: record);
  }

  /// 导航栏
  PreferredSizeWidget _buildAppBar() => AppBar(
    title: Text("功德记录")
  );
}