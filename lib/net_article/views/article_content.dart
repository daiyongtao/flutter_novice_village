import 'package:flutter/material.dart';
import 'package:flutter_novice_village/net_article/model/article.dart';
import 'package:flutter_novice_village/net_article/views/article_detail_page.dart';

import '../api/article_api.dart';

class ArticleContent extends StatefulWidget {
  const ArticleContent({super.key});

  @override
  State<StatefulWidget> createState() => _ArticleContentState();
}

class _ArticleContentState extends State<ArticleContent> {
  List<Article> _articles = [];
  ArticleApi api = ArticleApi();
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    _articles = await api.fetchArticleList(_page);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemExtent: 80,
        itemCount: _articles.length,
        itemBuilder: _buildItemByIndex,
    );
  }

  Widget _buildItemByIndex(BuildContext context, int index) {
    Article article = _articles[index];
    return ArticleItem(article: article, onTap: ()=> _jumpToDetail(article));
  }

  void _jumpToDetail(Article article) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => ArticleDetailPage(article: article))
    );
  }
}

/// 每一条文章对应的视图
class ArticleItem extends StatelessWidget {
  /// 文章模型
  final Article article;
  /// 点击事件
  final VoidCallback onTap;

  const ArticleItem({super.key, required this.article, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Text(
                    article.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  )),
                  const SizedBox(width: 10),
                  Text(article.time, style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey))
                ],
              ),
              const SizedBox(height: 4),
              Expanded(child:
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      article.url,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                          overflow: TextOverflow.ellipsis)
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
    return Stack(
      children: [
        Positioned(
            top: 10,
            bottom: 10,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Text(article.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black))),
                    Text(article.time, style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey)),
                  ]
                ),
                Text(article.url, style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey))
              ],
            )
        )
      ],
    );
  }
}