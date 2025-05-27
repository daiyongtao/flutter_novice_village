
import 'package:intl/intl.dart';

class Article {
  /// 文章标题
  final String title;
  /// 文章链接
  final String url;
  /// 时间戳
  final String time;

  Article(this.title, this.url, this.time);

  factory Article.formMap(dynamic map) {
    return Article(
        map['title'] ?? '未知',
        map['link'] ?? '',
        map['niceDate'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Article{title: $title, url: $url, time: $time}';
  }
}