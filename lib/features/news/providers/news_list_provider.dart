import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/news_article.dart';
import 'news_api_provider.dart';

part 'news_list_provider.g.dart';

/// 可選新聞分類，供列表頁分類條渲染。
const newsCategories = <String>[
  'technology',
  'tourism',
  'business',
  'crime',
  'science',
  'health',
  'sports',
  'entertainment',
  'world',
];

@Riverpod(dependencies: [newsApi])
/// 列表狀態控制器：管理分類切換、刷新與列表請求。
class NewsList extends _$NewsList {
  final String _query = 'ai';
  String _category = 'technology';

  @override
  Future<List<NewsArticle>> build() async {
    return _load();
  }

  Future<void> refresh() async {
    // 顯式切到 loading，提升互動可感知性。
    state = const AsyncLoading();
    state = await AsyncValue.guard(_load);
  }

  Future<void> selectCategory(String category) async {
    // 相同分類不重複請求，減少無效網路呼叫。
    if (_category == category) {
      return;
    }

    _category = category;
    await refresh();
  }

  Future<List<NewsArticle>> _load() async {
    // 可擴充：後續若接入分頁，可在這裡回傳合併後的列表。
    final page = await ref
        .read(newsApiProvider)
        .fetchLatest(query: _query, category: _category);
    return page.articles;
  }
}

@Riverpod(dependencies: [NewsList])
/// 目前選中的新聞分類：給 UI 讀取高亮狀態，避免直接暴露 Notifier getter。
String selectedNewsCategory(Ref ref) {
  // 訂閱列表狀態，分類切換觸發 refresh 後這裡會同步重算。
  ref.watch(newsListProvider);
  return ref.read(newsListProvider.notifier)._category;
}
