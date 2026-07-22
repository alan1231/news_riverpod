import 'package:flutter/material.dart';

/// 新聞分類橫向選擇條。
class NewsCategoryBar extends StatelessWidget {
  const NewsCategoryBar({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelected,
  });

  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = categories[index];

          // 使用 ChoiceChip 元件，自動處理選取態的樣式變化。
          return ChoiceChip(
            label: Text(_labelFor(category)),
            selected: category == selectedCategory,
            onSelected: (_) => onSelected(category),
          );
        },
      ),
    );
  }
}

String _labelFor(String category) {
  // 分類英文值映射為中文顯示文案。
  return switch (category) {
    'technology' => '科技',
    'tourism' => '旅遊',
    'business' => '商業',
    'crime' => '犯罪',
    'science' => '科學',
    'health' => '健康',
    'sports' => '體育',
    'entertainment' => '娛樂',
    'world' => '國際',
    _ => category,
  };
}
