// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

// Freezed 会生成不可变对象、copyWith、相等比较等代码。
part 'news_article.freezed.dart';
// json_serializable 会生成 fromJson / toJson 映射代码。
part 'news_article.g.dart';

@freezed
/// 新聞實體模型：負責承載介面欄位並提供 UI 友善的衍生屬性。
abstract class NewsArticle with _$NewsArticle {
  const NewsArticle._();

  const factory NewsArticle({
    @JsonKey(name: 'article_id') @Default('') String articleId,
    @Default('Untitled') String title,
    String? description,
    String? content,
    String? link,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'video_url') String? videoUrl,
    @JsonKey(name: 'source_id') String? sourceId,
    @JsonKey(name: 'source_name') @Default('Unknown Source') String sourceName,
    @JsonKey(name: 'source_priority') @Default(0) int sourcePriority,
    @JsonKey(name: 'source_url') String? sourceUrl,
    @JsonKey(name: 'source_icon') String? sourceIcon,
    @Default(<String>[]) List<String> creator,
    @JsonKey(name: 'pubDate', fromJson: _dateTimeFromJson) DateTime? pubDate,
    @JsonKey(name: 'pubDateTZ') String? pubDateTZ,
    @JsonKey(name: 'fetched_at') String? fetchedAt,
    @Default(<String>[]) List<String> category,
    @Default(<String>[]) List<String> country,
    @Default(<String>[]) List<String> keywords,
    String? language,
    String? datatype,
    @Default(false) bool duplicate,
  }) = _NewsArticle;

  /// 列表頁使用的摘要文字，優先取 description，否則取 sourceName。
  String get summaryText => (description != null && description!.isNotEmpty)
      ? description!
      : sourceName;

  /// 詳情頁使用的作者顯示文字，優先顯示 creator，否則回退到來源名稱。
  String get authorText => creator.isNotEmpty ? creator.join(', ') : sourceName;

  /// 詳情頁使用的正文內容，優先顯示 content，沒有就回退到 description。
  String get bodyText => (content != null && content!.isNotEmpty)
      ? content!
      : (description != null && description!.isNotEmpty)
      ? description!
      : summaryText;

  /// 是否存在可開啟的原文連結。
  bool get hasOriginalLink => link != null && link!.isNotEmpty;

  factory NewsArticle.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleFromJson(json);
}

DateTime? _dateTimeFromJson(Object? value) {
  // 介面時間欄位可能為空字串或非字串，統一轉成 null。
  if (value is! String || value.trim().isEmpty) {
    return null;
  }

  // 某些回傳是 "yyyy-MM-dd HH:mm:ss"，先補成 ISO 風格再解析。
  final normalized = value.trim().replaceFirst(' ', 'T');
  return DateTime.tryParse('${normalized}Z') ?? DateTime.tryParse(value);
}
