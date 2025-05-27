import 'package:flutter/material.dart';
import 'package:flutter_novice_village/net_article/views/article_content.dart';

class NetArticlePage extends StatefulWidget {
  const NetArticlePage({super.key});

  @override
  State<NetArticlePage> createState() => _NetArticlePageState();
}

class _NetArticlePageState extends State<NetArticlePage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('网络请求测试'),
      ),
      body: ArticleContent()
    );
  }
}