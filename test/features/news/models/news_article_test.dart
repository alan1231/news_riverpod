import 'package:flutter_news_riverpod_start/features/news/models/news_article.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NewsArticle', () {
    test('exposes derived fields for UI use', () {
      final article = NewsArticle(
        title: 'AI 新聞',
        description: '描述內容',
        content: '正文內容',
        link: 'https://example.com/original',
        creator: const ['Alice', 'Bob'],
        sourceName: '課程新聞',
      );

      expect(article.summaryText, '描述內容');
      expect(article.authorText, 'Alice, Bob');
      expect(article.bodyText, '正文內容');
      expect(article.hasOriginalLink, isTrue);
    });

    test('falls back when content fields are missing', () {
      final article = NewsArticle(title: 'AI 新聞', sourceName: '課程新聞');

      expect(article.summaryText, '課程新聞');
      expect(article.authorText, '課程新聞');
      expect(article.bodyText, '課程新聞');
      expect(article.hasOriginalLink, isFalse);
    });

    test('parses publication date from NewsData format', () {
      final article = NewsArticle.fromJson({
        'article_id': 'abc123',
        'title': 'AI 新聞',
        'source_name': '課程新聞',
        'pubDate': '2026-04-29 18:52:32',
      });

      expect(article.pubDate, isNotNull);
      expect(article.pubDate!.year, 2026);
      expect(article.pubDate!.month, 4);
      expect(article.pubDate!.day, 29);
    });
  });
}
