import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
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
  /// 是否正在加载
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    _isLoading = true;
    setState(() { });

    _articles = await api.fetchArticleList(_page);
    _isLoading = false;
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(
        child: Wrap(
          spacing: 10,
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: const [
            CupertinoActivityIndicator(),
            Text("数据加载中，请稍后...",style: TextStyle(color: Colors.grey))
          ],
        ),
      );
    }

    return EasyRefresh(
        header: const ClassicHeader(
            dragText: '下拉刷新',
            armedText: '释放刷新',
            readyText: '开始加载',
            processingText: '正在加载',
            processedText: '刷新成功'
        ),
        onRefresh: _onRefresh,

        footer: const ClassicFooter(
            processingText: "正在加载"
        ),
        onLoad: _onLoadMore,

        child: ListView.builder(
            itemExtent: 80,
            itemCount: _articles.length,
            itemBuilder: _buildItemByIndex,
        )
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

  /// 下拉刷新
  void _onRefresh() async {
    _page = 0;
    _articles = await api.fetchArticleList(_page);
    setState(() { });
  }

  /// 上拉加载更多
  void _onLoadMore() async {
    _page = _articles.length ~/ 20;
    List<Article> newArticles = await api.fetchArticleList(_page);
    _articles = _articles + newArticles;
    setState(() {});
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