import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/news_api_provider.dart';
import '../widgets/image_placeholder.dart';

class NewsDetailPage extends ConsumerWidget {
  const NewsDetailPage({super.key, required this.newsId});

  final String newsId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncArticle = ref.watch(newsDetailProvider(newsId));

    return Scaffold(
      appBar: AppBar(title: const Text('新聞詳情')),
      body: asyncArticle.when(
        loading: () => ListView(
          padding: const EdgeInsets.all(16),
          children: const [_DetailSkeleton()],
        ),
        error: (error, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('載入失敗：$error', textAlign: TextAlign.center),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () => ref.invalidate(newsDetailProvider(newsId)),
                icon: const Icon(Icons.refresh),
                label: const Text('重試'),
              ),
            ],
          ),
        ),
        data: (article) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '來源：${article.sourceName}',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                      ),
                      if (article.pubDate != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          '發佈時間：${article.pubDate}',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                        ),
                      ],
                      if (article.imageUrl != null) ...[
                        const SizedBox(height: 16),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            article.imageUrl!,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) {
                                return child;
                              }
                              return const ImagePlaceholder(height: 200);
                            },
                            errorBuilder: (_, error, stackTrace) =>
                                const SizedBox.shrink(),
                          ),
                        ),
                      ],
                      if (article.description != null) ...[
                        const SizedBox(height: 16),
                        Text(
                          article.description!,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                      if (article.content != null &&
                          !article.content!.contains('ONLY AVAILABLE')) ...[
                        const SizedBox(height: 12),
                        Text(article.content!),
                      ],
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
              if (article.link != null)
                SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: () => _openOriginal(context, article.link!),
                        icon: const Icon(Icons.open_in_new),
                        label: const Text('閱讀原文'),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

Future<void> _openOriginal(BuildContext context, String url) async {
  final uri = Uri.parse(url);

  try {
    final canOpen = await canLaunchUrl(uri);
    if (!canOpen) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('無法開啟原文連結')));
      }
      return;
    }

    final opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!opened && context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('無法開啟原文連結')));
    }
  } catch (_) {
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('無法開啟原文連結')));
    }
  }
}

class _DetailSkeleton extends StatelessWidget {
  const _DetailSkeleton();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SkeletonLine(
          width: 0.86,
          height: 28,
          color: scheme.surfaceContainerHighest,
        ),
        const SizedBox(height: 12),
        _SkeletonLine(width: 0.42, height: 14, color: scheme.outline),
        const SizedBox(height: 6),
        _SkeletonLine(width: 0.34, height: 14, color: scheme.outline),
        const SizedBox(height: 16),
        const ImagePlaceholder(height: 200),
        const SizedBox(height: 16),
        _SkeletonLine(
          width: 1,
          height: 16,
          color: scheme.surfaceContainerHighest,
        ),
        const SizedBox(height: 10),
        _SkeletonLine(
          width: 0.95,
          height: 16,
          color: scheme.surfaceContainerHighest,
        ),
        const SizedBox(height: 10),
        _SkeletonLine(
          width: 0.72,
          height: 16,
          color: scheme.surfaceContainerHighest,
        ),
        const SizedBox(height: 24),
        _SkeletonLine(width: 1, height: 48, color: scheme.primary),
      ],
    );
  }
}

class _SkeletonLine extends StatelessWidget {
  const _SkeletonLine({
    required this.width,
    required this.height,
    required this.color,
  });

  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final actualWidth = width <= 1
        ? MediaQuery.sizeOf(context).width * width
        : width;

    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: SizedBox(
        width: actualWidth,
        height: height,
        child: ColoredBox(color: color.withValues(alpha: 0.22)),
      ),
    );
  }
}
