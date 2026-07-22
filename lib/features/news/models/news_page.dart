import 'news_article.dart';

/// 新聞分頁結果：目前頁文章 + 下一頁游標。
class NewsPage {
  const NewsPage({required this.articles, this.nextPage});

  /// 目前頁文章列表。
  final List<NewsArticle> articles;

  /// 下一頁標記，介面可能為空，表示沒有更多資料。
  final String? nextPage;
}
