import 'package:dio/dio.dart';
import 'package:flutter_news_riverpod_start/core/network/api_exception.dart';
import 'package:flutter_news_riverpod_start/features/news/api/news_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NewsApi', () {
    test('maps successful latest response to a NewsPage', () async {
      final api = NewsApi(
        _dioWithResponse({
          'status': 'success',
          'nextPage': 'next-token',
          'results': [
            {
              'article_id': 'abc123',
              'title': 'AI 新聞',
              'description': '新聞摘要',
              'source_name': '課程新聞',
              'pubDate': '2026-04-29 18:52:32',
            },
          ],
        }),
      );

      final page = await api.fetchLatest();

      expect(page.nextPage, 'next-token');
      expect(page.articles.single.articleId, 'abc123');
      expect(page.articles.single.title, 'AI 新聞');
    });

    test('sends expected filters without excludecountry', () async {
      late Map<String, dynamic> capturedQueryParameters;

      final dio = Dio(BaseOptions(baseUrl: 'https://example.test'));
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            capturedQueryParameters = Map<String, dynamic>.from(
              options.queryParameters,
            );
            handler.resolve(
              Response<Map<String, dynamic>>(
                requestOptions: options,
                statusCode: 200,
                data: const {'status': 'success', 'results': []},
              ),
            );
          },
        ),
      );

      final api = NewsApi(dio);
      await api.fetchLatest();

      expect(capturedQueryParameters['country'], 'hk,tw,us,gb');
      expect(capturedQueryParameters['category'], 'technology');
      expect(capturedQueryParameters['language'], 'zh,en');
      expect(capturedQueryParameters['removeduplicate'], 1);
      expect(capturedQueryParameters.containsKey('excludecountry'), isFalse);
    });

    test('maps DioException to readable network error', () async {
      final dio = Dio(BaseOptions(baseUrl: 'https://example.test'));
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            // 用攔截器模擬逾時，不存取真實網路。
            handler.reject(
              DioException(
                requestOptions: options,
                type: DioExceptionType.connectionTimeout,
              ),
            );
          },
        ),
      );
      final api = NewsApi(dio);

      await expectLater(
        api.fetchLatest(),
        throwsA(
          isA<ApiException>().having(
            (error) => error.message,
            'message',
            '網路逾時，請稍後重試',
          ),
        ),
      );
    });
  });
}

Dio _dioWithResponse(Map<String, dynamic> body) {
  final dio = Dio(BaseOptions(baseUrl: 'https://example.test'));
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        // 直接回傳假回應，讓測試穩定、快速、不依賴外網。
        handler.resolve(
          Response<Map<String, dynamic>>(
            requestOptions: options,
            statusCode: 200,
            data: body,
          ),
        );
      },
    ),
  );
  return dio;
}
