import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/experimental/scope.dart';

import '../../../core/router/app_routes.dart';
import '../providers/news_list_provider.dart';
import '../widgets/news_card.dart';
import '../widgets/news_category_bar.dart';
import '../widgets/news_state_view.dart';

/// 新聞列表頁：展示分類、列表資料，並處理載入/錯誤/空態。
@Dependencies([NewsList, selectedNewsCategory])
class NewsListPage extends ConsumerWidget {
  const NewsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 資料流：UI watch -> newsListProvider -> NewsList(Notifier) -> NewsApi。
    final newsState = ref.watch(newsListProvider);
    // 分類高亮狀態單獨由 Provider 暴露，避免 UI 直接讀取 Notifier 欄位。
    final selectedCategory = ref.watch(selectedNewsCategoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('News Course'), centerTitle: false),
      body: Column(
        children: [
          // 分類選擇條，切換分類會觸發 Provider 內部刷新資料。
          NewsCategoryBar(
            categories: newsCategories,
            selectedCategory: selectedCategory,
            onSelected: (category) {
              // 觸發分類切換後，Provider 內部會刷新資料。
              ref.read(newsListProvider.notifier).selectCategory(category);
            },
          ),
          const Divider(height: 1),
          Expanded(
            child: newsState.when(
              loading: () => const NewsLoadingView(),
              error: (error, _) => NewsErrorView(
                message: error.toString(),
                // 直接 invalidate 觸發重試，簡化互動邏輯。
                onRetry: () => ref.invalidate(newsListProvider),
              ),
              data: (articles) {
                // 列表資料為空時顯示空態視圖，提示使用者目前沒有內容。
                if (articles.isEmpty) {
                  // 空列表時仍保留下拉刷新能力，方便使用者主動重試。
                  return RefreshIndicator(
                    onRefresh: () =>
                        ref.read(newsListProvider.notifier).refresh(),
                    child: const CustomScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      slivers: [SliverFillRemaining(child: NewsEmptyView())],
                    ),
                  );
                }

                // 列表資料正常時顯示文章列表，支援下拉刷新。
                return RefreshIndicator(
                  onRefresh: () =>
                      ref.read(newsListProvider.notifier).refresh(),
                  child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: articles.length,
                    separatorBuilder: (_, _) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final article = articles[index];
                      return NewsCard(
                        article: article,
                        // 使用集中管理的路徑生成函式，避免頁面裡手動拼接路由字串。
                        onTap: () => context.push(
                          AppRoutes.newsDetailPath(article.articleId),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
