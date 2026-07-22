import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/dio_provider.dart';
import '../api/news_api.dart';
import '../models/news_article.dart';
import '../models/news_page.dart';

part 'news_api_provider.g.dart';

@Riverpod(keepAlive: true)
/// 注入 NewsApi 單例，供列表與詳情 Provider 共用。
NewsApi newsApi(Ref ref) {
  return NewsApi(ref.watch(dioProvider));
}

@riverpod
/// 非同步載入新聞列表，支援分頁。
Future<NewsPage> newsList(
  Ref ref, {
  String query = 'ai',
  String category = 'technology',
  String? page,
}) async {
  final api = ref.watch(newsApiProvider);
  try {
    return await api.fetchLatest(query: query, category: category, page: page);
  } catch (e, st) {
    debugPrint('❌ newsList error: $e');
    debugPrint('Stack trace: $st');
    rethrow;
  }
}

@riverpod
/// 根據 ID 載入單篇新聞詳情。
Future<NewsArticle> newsDetail(Ref ref, String id) async {
  final api = ref.watch(newsApiProvider);
  try {
    return await api.fetchById(id);
  } catch (e, st) {
    debugPrint('❌ newsDetail error: $e');
    debugPrint('Stack trace: $st');
    rethrow;
  }
}
