import 'package:flutter/material.dart';

import 'image_placeholder.dart';

/// 通用載入態視圖。
class NewsLoadingView extends StatelessWidget {
  const NewsLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: 6,
      separatorBuilder: (_, _) => const SizedBox(height: 16),
      itemBuilder: (context, index) => const _NewsCardSkeleton(),
    );
  }
}

class NewsErrorView extends StatelessWidget {
  const NewsErrorView({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    // 錯誤態統一提供重試入口，避免使用者只能返回上一頁。
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 錯誤圖示使用主題色的 error，確保在亮色/暗色模式下都具備可讀性。
            Icon(
              Icons.error_outline,
              size: 40,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 12),
            // 錯誤資訊文字置中顯示，字型顏色使用主題色的 onSurfaceVariant，確保在亮色/暗色模式下都具備可讀性。
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            // 重試按鈕使用 FilledButton，提供明確的點擊區域和視覺回饋。
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('重試'),
            ),
          ],
        ),
      ),
    );
  }
}

// 空態視圖：當資料為空時顯示，提示使用者目前沒有內容。
class NewsEmptyView extends StatelessWidget {
  const NewsEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.article_outlined,
              size: 44,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 12),
            Text('暫無新聞', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}

class _NewsCardSkeleton extends StatelessWidget {
  const _NewsCardSkeleton();

  @override
  Widget build(BuildContext context) {
    final surface = Theme.of(context).colorScheme.surfaceContainerHighest;
    final outline = Theme.of(context).colorScheme.outline;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 112, child: ImagePlaceholder(height: 82)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SkeletonLine(width: double.infinity, color: surface),
              const SizedBox(height: 8),
              _SkeletonLine(width: 0.82, color: surface),
              const SizedBox(height: 12),
              _SkeletonLine(width: 0.48, height: 12, color: outline),
            ],
          ),
        ),
      ],
    );
  }
}

class _SkeletonLine extends StatelessWidget {
  const _SkeletonLine({
    required this.width,
    required this.color,
    this.height = 16,
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
        child: ColoredBox(color: color.withValues(alpha: 0.24)),
      ),
    );
  }
}
