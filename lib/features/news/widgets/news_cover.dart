import 'package:flutter/material.dart';

import 'image_placeholder.dart';

/// 新聞封面圖元件：統一處理空圖、載入中、載入失敗三種狀態。
class NewsCover extends StatelessWidget {
  const NewsCover({super.key, this.imageUrl, this.height = 96});

  final String? imageUrl;
  final double height;

  @override
  Widget build(BuildContext context) {
    final url = imageUrl;
    // 無圖片位址時直接顯示占位圖，避免網路元件不必要初始化。
    if (url == null || url.isEmpty) {
      return ImagePlaceholder(height: height, showIcon: true);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        url,
        height: height,
        width: double.infinity,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) {
            return child;
          }
          return ImagePlaceholder(height: height);
        },
        errorBuilder: (_, _, _) =>
            ImagePlaceholder(height: height, showIcon: true),
      ),
    );
  }
}
