

// https://www.wanandroid.com/article/list/0/json

// page = 0，表示第几页


import 'package:dio/dio.dart';

import '../model/article.dart';

class ArticleApi {

  static const String kBaseUrl = 'https://www.wanandroid.com';

  final Dio _client = Dio(BaseOptions(baseUrl: kBaseUrl));

  /// 请求
  Future<List<Article>> fetchArticleList(int page) async {

    String path = '/article/list/$page/json';
    var resp = await _client.get(path);
    if (resp.statusCode == 200 && resp.data != null) {
      var data = resp.data['data']['datas'] as List;
      return data.map(Article.formMap).toList();
    }

    return [];
  }

}