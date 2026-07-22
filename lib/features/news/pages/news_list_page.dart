import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../providers/news_list_provider.dart';

/// 新闻列表页：本课先接入 Provider，下一课再拆成更完整的 UI 组件。
class NewsListPage extends ConsumerWidget {
  const NewsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // UI 订阅列表异步状态：loading / data / error。
    final newsState = ref.watch(newsListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('新闻列表')),
      body: newsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(error.toString()),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: () => ref.invalidate(newsListProvider),
                child: const Text('重试'),
              ),
            ],
          ),
        ),
        data: (articles) {
          if (articles.isEmpty) {
            return const Center(child: Text('暂无新闻'));
          }

          return RefreshIndicator(
            onRefresh: () => ref.read(newsListProvider.notifier).refresh(),
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: articles.length,
              separatorBuilder: (_, _) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final article = articles[index];
                return ListTile(
                  title: Text(article.title),
                  subtitle: Text(article.summaryText),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // 详情页仍复用第 3 课的路由路径生成函数。
                    context.push(AppRoutes.newsDetailPath(article.articleId));
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}


