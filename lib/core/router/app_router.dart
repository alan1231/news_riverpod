import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/news/pages/news_detail_page.dart';
import '../../features/news/pages/news_list_page.dart';
import 'app_routes.dart';

// 這一行必須保留，build_runner 會根據它生成 app_router.g.dart。
part 'app_router.g.dart';

/// 應用級路由 Provider。
///
/// keepAlive 表示這個路由物件在應用執行期間保持穩定。
@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  return GoRouter(
    // 應用啟動後預設進入新聞列表頁。
    initialLocation: AppRoutes.news,
    routes: [
      // /news -> 新聞列表頁
      GoRoute(path: AppRoutes.news, builder: (_, _) => const NewsListPage()),
      // /news/:id -> 新聞詳情頁
      GoRoute(
        path: AppRoutes.newsDetail,
        builder: (_, state) {
          // 從路徑參數讀取 id，例如 /news/article_001 中的 article_001。
          final id = state.pathParameters['id']!;
          return NewsDetailPage(newsId: id);
        },
      ),
    ],
  );
}
