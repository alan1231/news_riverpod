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
              'title': 'AI 新闻',
              'description': '新闻摘要',
              'source_name': '课程新闻',
              'pubDate': '2026-04-29 18:52:32',
            },
          ],
        }),
      );

      final page = await api.fetchLatest();

      expect(page.nextPage, 'next-token');
      expect(page.articles.single.articleId, 'abc123');
      expect(page.articles.single.title, 'AI 新闻');
    });

    test('maps DioException to readable network error', () async {
      final dio = Dio(BaseOptions(baseUrl: 'https://example.test'));
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            // 用拦截器模拟超时，不访问真实网络。
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
            '网络超时，请稍后重试',
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
        // 直接返回假响应，让测试稳定、快速、不依赖外网。
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
