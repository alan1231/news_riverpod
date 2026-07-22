import 'package:dio/dio.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/error_mapper.dart';
import '../models/news_article.dart';
import '../models/news_page.dart';

/// 新聞介面存取層：負責把遠端 JSON 轉成應用內可用的資料模型。
class NewsApi {
  NewsApi(this._dio);

  /// 統一介面位址，網域來自第 4 課的 DioClient.baseUrl。
  static const _endpoint = '/api/1/latest';

  /// 本機兜底 Key，方便課程示範直接執行。
  static const _fallbackApiKey = 'pub_a7900fe467a4425bb7788db3ca695246';

  /// 優先讀取編譯期環境變數，未提供時回落到兜底值。
  static const _apiKey = String.fromEnvironment(
    'NEWSDATA_API_KEY',
    defaultValue: _fallbackApiKey,
  );

  final Dio _dio;

  Future<NewsPage> fetchLatest({
    String query = 'ai',
    String category = 'technology',
    String? page,
  }) async {
    try {
      // 組裝查詢參數並請求 Newsdata 最新新聞介面。
      final response = await _dio.get<Map<String, dynamic>>(
        _endpoint,
        queryParameters: _queryParameters(
          query: query,
          category: category,
          page: page,
        ),
      );
      final body = response.data ?? const <String, dynamic>{};
      _ensureSuccess(body);

      final results = body['results'];
      // 只保留結構正確且 article_id 不為空的文章，避免髒資料進入 UI。
      final articles = results is List
          ? results
                .whereType<Map<String, dynamic>>()
                .map(NewsArticle.fromJson)
                .where((article) => article.articleId.isNotEmpty)
                .toList()
          : <NewsArticle>[];

      return NewsPage(
        articles: articles,
        nextPage: body['nextPage'] as String?,
      );
    } catch (error) {
      // 統一把 DioException 和業務異常轉成 ApiException。
      throw mapNetworkError(error);
    }
  }

  Future<NewsArticle> fetchById(String id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        _endpoint,
        queryParameters: {'apikey': _apiKey, 'id': id},
      );
      final body = response.data ?? const <String, dynamic>{};
      _ensureSuccess(body);

      final results = body['results'];
      // 詳情介面理論上回傳單筆結果，這裡做邊界保護。
      if (results is! List || results.isEmpty) {
        throw const ApiException('沒有找到這篇新聞');
      }

      final first = results.first;
      if (first is! Map<String, dynamic>) {
        throw const ApiException('新聞詳情格式異常');
      }

      return NewsArticle.fromJson(first);
    } catch (error) {
      throw mapNetworkError(error);
    }
  }

  Map<String, dynamic> _queryParameters({
    required String query,
    required String category,
    String? page,
  }) {
    // 統一維護查詢參數，避免呼叫端零散拼裝邏輯。
    final params = <String, dynamic>{
      'apikey': _apiKey,
      'q': query,
      'country': 'hk,tw,us,gb',
      'category': category,
      'language': 'zh,en',
      'removeduplicate': 1,
    };
    if (page != null) {
      params['page'] = page;
    }
    return params;
  }

  void _ensureSuccess(Map<String, dynamic> body) {
    if (body['status'] == 'success') {
      return;
    }

    // 伺服器失敗時優先透傳後端訊息，方便頁面展示可讀錯誤。
    final message = body['results'] ?? body['message'] ?? '新聞服務回傳異常';
    throw ApiException(message.toString());
  }
}
