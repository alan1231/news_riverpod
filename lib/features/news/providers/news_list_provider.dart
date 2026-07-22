import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/news_article.dart';
import 'news_api_provider.dart';

part 'news_list_provider.g.dart';

/// 可选新闻分类，供列表页分类条渲染。
const newsCategories = <String>[
  'technology',
  'business',
  'science',
  'health',
  'sports',
  'entertainment',
  'world',
];

@riverpod
/// 列表状态控制器：管理分类切换、刷新与列表请求。
class NewsList extends _$NewsList {
  final String _query = 'ai';
  String _category = 'technology';

  @override
  Future<List<NewsArticle>> build() async {
    return _load();
  }

  Future<List<NewsArticle>> _load() async {
    // 可扩展：后续若接入分页，可在这里返回合并后的列表。
    final page = await ref
        .read(newsApiProvider)
        .fetchLatest(query: _query, category: _category);
    return page.articles;
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(() => _load());
  }
}
