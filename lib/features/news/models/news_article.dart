// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

// Freezed 会生成不可变对象、copyWith、相等比较等代码。
part 'news_article.freezed.dart';
// json_serializable 会生成 fromJson / toJson 映射代码。
part 'news_article.g.dart';

@freezed
/// 新闻实体模型：负责承载接口字段并提供 UI 友好的派生属性。
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

  factory NewsArticle.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleFromJson(json);
}

DateTime? _dateTimeFromJson(Object? value) {
  // 接口时间字段可能为空串或非字符串，统一转成 null。
  if (value is! String || value.trim().isEmpty) {
    return null;
  }

  // 某些返回是 "yyyy-MM-dd HH:mm:ss"，先补成 ISO 风格再解析。
  final normalized = value.trim().replaceFirst(' ', 'T');
  return DateTime.tryParse('${normalized}Z') ?? DateTime.tryParse(value);
}
