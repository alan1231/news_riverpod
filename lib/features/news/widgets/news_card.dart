import 'package:flutter/material.dart';

import '../models/news_article.dart';
import 'news_cover.dart';

/// 新聞卡片：在列表中展示標題、摘要、來源與封面。
class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.article, required this.onTap});

  final NewsArticle article;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 固定寬高的封面圖，保持列表項高度一致。
            SizedBox(
              width: 112,
              child: NewsCover(imageUrl: article.imageUrl, height: 82),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 標題限制兩行，溢出顯示省略號。
                  Text(
                    article.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // 摘要限制兩行，字型顏色使用主題色的 onSurfaceVariant，確保在亮色/暗色模式下都具備可讀性。
                  Text(
                    article.summaryText,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // 來源和發佈時間放在同一行，字型顏色使用主題色的 outline，弱化視覺層級。
                  Text(
                    '${article.sourceName} · ${_formatDate(article.pubDate)}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _formatDate(DateTime? value) {
  // 列表情境使用短時間格式：MM-dd HH:mm。
  if (value == null) {
    return '未知時間';
  }

  final local = value.toLocal();
  final month = local.month.toString().padLeft(2, '0');
  final day = local.day.toString().padLeft(2, '0');
  final hour = local.hour.toString().padLeft(2, '0');
  final minute = local.minute.toString().padLeft(2, '0');
  return '$month-$day $hour:$minute';
}
