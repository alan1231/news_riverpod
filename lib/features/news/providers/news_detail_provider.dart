import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/news_article.dart';
import 'news_api_provider.dart';

part 'news_detail_provider.g.dart';

@Riverpod(dependencies: [newsApi])
/// 詳情 Provider：按新聞 id 拉取單篇文章。
Future<NewsArticle> newsDetail(Ref ref, String id) {
  // family 參數 id 來自路由 /news/:id。
  return ref.read(newsApiProvider).fetchById(id);
}
