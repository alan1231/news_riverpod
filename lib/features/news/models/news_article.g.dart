// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewsArticle _$NewsArticleFromJson(Map<String, dynamic> json) => _NewsArticle(
  articleId: json['article_id'] as String? ?? '',
  title: json['title'] as String? ?? 'Untitled',
  description: json['description'] as String?,
  content: json['content'] as String?,
  link: json['link'] as String?,
  imageUrl: json['image_url'] as String?,
  videoUrl: json['video_url'] as String?,
  sourceId: json['source_id'] as String?,
  sourceName: json['source_name'] as String? ?? 'Unknown Source',
  sourcePriority: (json['source_priority'] as num?)?.toInt() ?? 0,
  sourceUrl: json['source_url'] as String?,
  sourceIcon: json['source_icon'] as String?,
  creator:
      (json['creator'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  pubDate: _dateTimeFromJson(json['pubDate']),
  pubDateTZ: json['pubDateTZ'] as String?,
  fetchedAt: json['fetched_at'] as String?,
  category:
      (json['category'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  country:
      (json['country'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  keywords:
      (json['keywords'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  language: json['language'] as String?,
  datatype: json['datatype'] as String?,
  duplicate: json['duplicate'] as bool? ?? false,
);

Map<String, dynamic> _$NewsArticleToJson(_NewsArticle instance) =>
    <String, dynamic>{
      'article_id': instance.articleId,
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'link': instance.link,
      'image_url': instance.imageUrl,
      'video_url': instance.videoUrl,
      'source_id': instance.sourceId,
      'source_name': instance.sourceName,
      'source_priority': instance.sourcePriority,
      'source_url': instance.sourceUrl,
      'source_icon': instance.sourceIcon,
      'creator': instance.creator,
      'pubDate': instance.pubDate?.toIso8601String(),
      'pubDateTZ': instance.pubDateTZ,
      'fetched_at': instance.fetchedAt,
      'category': instance.category,
      'country': instance.country,
      'keywords': instance.keywords,
      'language': instance.language,
      'datatype': instance.datatype,
      'duplicate': instance.duplicate,
    };
