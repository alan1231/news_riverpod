import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_news_riverpod_start/features/news/api/news_api.dart';
import 'package:flutter_news_riverpod_start/features/news/models/news_article.dart';
import 'package:flutter_news_riverpod_start/features/news/pages/news_detail_page.dart';
import 'package:flutter_news_riverpod_start/features/news/providers/news_api_provider.dart';

void main() {
  testWidgets('NewsDetailPage renders article content and original button', (
    tester,
  ) async {
    const newsId = 'abc123';
    final article = NewsArticle(
      articleId: newsId,
      title: 'AI 新聞',
      description: '這是摘要',
      content: '這是正文',
      link: 'https://example.com/original',
      sourceName: '課程新聞',
      creator: const ['Alice'],
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [newsApiProvider.overrideWithValue(_FakeNewsApi(article))],
        child: const MaterialApp(home: NewsDetailPage(newsId: newsId)),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('AI 新聞'), findsOneWidget);
    expect(find.textContaining('課程新聞'), findsOneWidget);
    expect(find.text('這是摘要'), findsOneWidget);
    expect(find.text('這是正文'), findsOneWidget);
    expect(find.text('閱讀原文'), findsOneWidget);
  });
}

class _FakeNewsApi extends NewsApi {
  _FakeNewsApi(this.article)
    : super(Dio(BaseOptions(baseUrl: 'https://example.test')));

  final NewsArticle article;

  @override
  Future<NewsArticle> fetchById(String id) async => article;
}
