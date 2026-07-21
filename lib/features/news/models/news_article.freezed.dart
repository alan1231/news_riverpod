// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsArticle {

@JsonKey(name: 'article_id') String get articleId; String get title; String? get description; String? get content; String? get link;@JsonKey(name: 'image_url') String? get imageUrl;@JsonKey(name: 'video_url') String? get videoUrl;@JsonKey(name: 'source_id') String? get sourceId;@JsonKey(name: 'source_name') String get sourceName;@JsonKey(name: 'source_priority') int get sourcePriority;@JsonKey(name: 'source_url') String? get sourceUrl;@JsonKey(name: 'source_icon') String? get sourceIcon; List<String> get creator;@JsonKey(name: 'pubDate', fromJson: _dateTimeFromJson) DateTime? get pubDate;@JsonKey(name: 'pubDateTZ') String? get pubDateTZ;@JsonKey(name: 'fetched_at') String? get fetchedAt; List<String> get category; List<String> get country; List<String> get keywords; String? get language; String? get datatype; bool get duplicate;
/// Create a copy of NewsArticle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsArticleCopyWith<NewsArticle> get copyWith => _$NewsArticleCopyWithImpl<NewsArticle>(this as NewsArticle, _$identity);

  /// Serializes this NewsArticle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsArticle&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.content, content) || other.content == content)&&(identical(other.link, link) || other.link == link)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.sourceName, sourceName) || other.sourceName == sourceName)&&(identical(other.sourcePriority, sourcePriority) || other.sourcePriority == sourcePriority)&&(identical(other.sourceUrl, sourceUrl) || other.sourceUrl == sourceUrl)&&(identical(other.sourceIcon, sourceIcon) || other.sourceIcon == sourceIcon)&&const DeepCollectionEquality().equals(other.creator, creator)&&(identical(other.pubDate, pubDate) || other.pubDate == pubDate)&&(identical(other.pubDateTZ, pubDateTZ) || other.pubDateTZ == pubDateTZ)&&(identical(other.fetchedAt, fetchedAt) || other.fetchedAt == fetchedAt)&&const DeepCollectionEquality().equals(other.category, category)&&const DeepCollectionEquality().equals(other.country, country)&&const DeepCollectionEquality().equals(other.keywords, keywords)&&(identical(other.language, language) || other.language == language)&&(identical(other.datatype, datatype) || other.datatype == datatype)&&(identical(other.duplicate, duplicate) || other.duplicate == duplicate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,articleId,title,description,content,link,imageUrl,videoUrl,sourceId,sourceName,sourcePriority,sourceUrl,sourceIcon,const DeepCollectionEquality().hash(creator),pubDate,pubDateTZ,fetchedAt,const DeepCollectionEquality().hash(category),const DeepCollectionEquality().hash(country),const DeepCollectionEquality().hash(keywords),language,datatype,duplicate]);

@override
String toString() {
  return 'NewsArticle(articleId: $articleId, title: $title, description: $description, content: $content, link: $link, imageUrl: $imageUrl, videoUrl: $videoUrl, sourceId: $sourceId, sourceName: $sourceName, sourcePriority: $sourcePriority, sourceUrl: $sourceUrl, sourceIcon: $sourceIcon, creator: $creator, pubDate: $pubDate, pubDateTZ: $pubDateTZ, fetchedAt: $fetchedAt, category: $category, country: $country, keywords: $keywords, language: $language, datatype: $datatype, duplicate: $duplicate)';
}


}

/// @nodoc
abstract mixin class $NewsArticleCopyWith<$Res>  {
  factory $NewsArticleCopyWith(NewsArticle value, $Res Function(NewsArticle) _then) = _$NewsArticleCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'article_id') String articleId, String title, String? description, String? content, String? link,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'video_url') String? videoUrl,@JsonKey(name: 'source_id') String? sourceId,@JsonKey(name: 'source_name') String sourceName,@JsonKey(name: 'source_priority') int sourcePriority,@JsonKey(name: 'source_url') String? sourceUrl,@JsonKey(name: 'source_icon') String? sourceIcon, List<String> creator,@JsonKey(name: 'pubDate', fromJson: _dateTimeFromJson) DateTime? pubDate,@JsonKey(name: 'pubDateTZ') String? pubDateTZ,@JsonKey(name: 'fetched_at') String? fetchedAt, List<String> category, List<String> country, List<String> keywords, String? language, String? datatype, bool duplicate
});




}
/// @nodoc
class _$NewsArticleCopyWithImpl<$Res>
    implements $NewsArticleCopyWith<$Res> {
  _$NewsArticleCopyWithImpl(this._self, this._then);

  final NewsArticle _self;
  final $Res Function(NewsArticle) _then;

/// Create a copy of NewsArticle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? articleId = null,Object? title = null,Object? description = freezed,Object? content = freezed,Object? link = freezed,Object? imageUrl = freezed,Object? videoUrl = freezed,Object? sourceId = freezed,Object? sourceName = null,Object? sourcePriority = null,Object? sourceUrl = freezed,Object? sourceIcon = freezed,Object? creator = null,Object? pubDate = freezed,Object? pubDateTZ = freezed,Object? fetchedAt = freezed,Object? category = null,Object? country = null,Object? keywords = null,Object? language = freezed,Object? datatype = freezed,Object? duplicate = null,}) {
  return _then(_self.copyWith(
articleId: null == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,sourceId: freezed == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String?,sourceName: null == sourceName ? _self.sourceName : sourceName // ignore: cast_nullable_to_non_nullable
as String,sourcePriority: null == sourcePriority ? _self.sourcePriority : sourcePriority // ignore: cast_nullable_to_non_nullable
as int,sourceUrl: freezed == sourceUrl ? _self.sourceUrl : sourceUrl // ignore: cast_nullable_to_non_nullable
as String?,sourceIcon: freezed == sourceIcon ? _self.sourceIcon : sourceIcon // ignore: cast_nullable_to_non_nullable
as String?,creator: null == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as List<String>,pubDate: freezed == pubDate ? _self.pubDate : pubDate // ignore: cast_nullable_to_non_nullable
as DateTime?,pubDateTZ: freezed == pubDateTZ ? _self.pubDateTZ : pubDateTZ // ignore: cast_nullable_to_non_nullable
as String?,fetchedAt: freezed == fetchedAt ? _self.fetchedAt : fetchedAt // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as List<String>,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as List<String>,keywords: null == keywords ? _self.keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,datatype: freezed == datatype ? _self.datatype : datatype // ignore: cast_nullable_to_non_nullable
as String?,duplicate: null == duplicate ? _self.duplicate : duplicate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NewsArticle].
extension NewsArticlePatterns on NewsArticle {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewsArticle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsArticle() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewsArticle value)  $default,){
final _that = this;
switch (_that) {
case _NewsArticle():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewsArticle value)?  $default,){
final _that = this;
switch (_that) {
case _NewsArticle() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'article_id')  String articleId,  String title,  String? description,  String? content,  String? link, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'video_url')  String? videoUrl, @JsonKey(name: 'source_id')  String? sourceId, @JsonKey(name: 'source_name')  String sourceName, @JsonKey(name: 'source_priority')  int sourcePriority, @JsonKey(name: 'source_url')  String? sourceUrl, @JsonKey(name: 'source_icon')  String? sourceIcon,  List<String> creator, @JsonKey(name: 'pubDate', fromJson: _dateTimeFromJson)  DateTime? pubDate, @JsonKey(name: 'pubDateTZ')  String? pubDateTZ, @JsonKey(name: 'fetched_at')  String? fetchedAt,  List<String> category,  List<String> country,  List<String> keywords,  String? language,  String? datatype,  bool duplicate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewsArticle() when $default != null:
return $default(_that.articleId,_that.title,_that.description,_that.content,_that.link,_that.imageUrl,_that.videoUrl,_that.sourceId,_that.sourceName,_that.sourcePriority,_that.sourceUrl,_that.sourceIcon,_that.creator,_that.pubDate,_that.pubDateTZ,_that.fetchedAt,_that.category,_that.country,_that.keywords,_that.language,_that.datatype,_that.duplicate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'article_id')  String articleId,  String title,  String? description,  String? content,  String? link, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'video_url')  String? videoUrl, @JsonKey(name: 'source_id')  String? sourceId, @JsonKey(name: 'source_name')  String sourceName, @JsonKey(name: 'source_priority')  int sourcePriority, @JsonKey(name: 'source_url')  String? sourceUrl, @JsonKey(name: 'source_icon')  String? sourceIcon,  List<String> creator, @JsonKey(name: 'pubDate', fromJson: _dateTimeFromJson)  DateTime? pubDate, @JsonKey(name: 'pubDateTZ')  String? pubDateTZ, @JsonKey(name: 'fetched_at')  String? fetchedAt,  List<String> category,  List<String> country,  List<String> keywords,  String? language,  String? datatype,  bool duplicate)  $default,) {final _that = this;
switch (_that) {
case _NewsArticle():
return $default(_that.articleId,_that.title,_that.description,_that.content,_that.link,_that.imageUrl,_that.videoUrl,_that.sourceId,_that.sourceName,_that.sourcePriority,_that.sourceUrl,_that.sourceIcon,_that.creator,_that.pubDate,_that.pubDateTZ,_that.fetchedAt,_that.category,_that.country,_that.keywords,_that.language,_that.datatype,_that.duplicate);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'article_id')  String articleId,  String title,  String? description,  String? content,  String? link, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'video_url')  String? videoUrl, @JsonKey(name: 'source_id')  String? sourceId, @JsonKey(name: 'source_name')  String sourceName, @JsonKey(name: 'source_priority')  int sourcePriority, @JsonKey(name: 'source_url')  String? sourceUrl, @JsonKey(name: 'source_icon')  String? sourceIcon,  List<String> creator, @JsonKey(name: 'pubDate', fromJson: _dateTimeFromJson)  DateTime? pubDate, @JsonKey(name: 'pubDateTZ')  String? pubDateTZ, @JsonKey(name: 'fetched_at')  String? fetchedAt,  List<String> category,  List<String> country,  List<String> keywords,  String? language,  String? datatype,  bool duplicate)?  $default,) {final _that = this;
switch (_that) {
case _NewsArticle() when $default != null:
return $default(_that.articleId,_that.title,_that.description,_that.content,_that.link,_that.imageUrl,_that.videoUrl,_that.sourceId,_that.sourceName,_that.sourcePriority,_that.sourceUrl,_that.sourceIcon,_that.creator,_that.pubDate,_that.pubDateTZ,_that.fetchedAt,_that.category,_that.country,_that.keywords,_that.language,_that.datatype,_that.duplicate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NewsArticle extends NewsArticle {
  const _NewsArticle({@JsonKey(name: 'article_id') this.articleId = '', this.title = 'Untitled', this.description, this.content, this.link, @JsonKey(name: 'image_url') this.imageUrl, @JsonKey(name: 'video_url') this.videoUrl, @JsonKey(name: 'source_id') this.sourceId, @JsonKey(name: 'source_name') this.sourceName = 'Unknown Source', @JsonKey(name: 'source_priority') this.sourcePriority = 0, @JsonKey(name: 'source_url') this.sourceUrl, @JsonKey(name: 'source_icon') this.sourceIcon, final  List<String> creator = const <String>[], @JsonKey(name: 'pubDate', fromJson: _dateTimeFromJson) this.pubDate, @JsonKey(name: 'pubDateTZ') this.pubDateTZ, @JsonKey(name: 'fetched_at') this.fetchedAt, final  List<String> category = const <String>[], final  List<String> country = const <String>[], final  List<String> keywords = const <String>[], this.language, this.datatype, this.duplicate = false}): _creator = creator,_category = category,_country = country,_keywords = keywords,super._();
  factory _NewsArticle.fromJson(Map<String, dynamic> json) => _$NewsArticleFromJson(json);

@override@JsonKey(name: 'article_id') final  String articleId;
@override@JsonKey() final  String title;
@override final  String? description;
@override final  String? content;
@override final  String? link;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override@JsonKey(name: 'video_url') final  String? videoUrl;
@override@JsonKey(name: 'source_id') final  String? sourceId;
@override@JsonKey(name: 'source_name') final  String sourceName;
@override@JsonKey(name: 'source_priority') final  int sourcePriority;
@override@JsonKey(name: 'source_url') final  String? sourceUrl;
@override@JsonKey(name: 'source_icon') final  String? sourceIcon;
 final  List<String> _creator;
@override@JsonKey() List<String> get creator {
  if (_creator is EqualUnmodifiableListView) return _creator;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_creator);
}

@override@JsonKey(name: 'pubDate', fromJson: _dateTimeFromJson) final  DateTime? pubDate;
@override@JsonKey(name: 'pubDateTZ') final  String? pubDateTZ;
@override@JsonKey(name: 'fetched_at') final  String? fetchedAt;
 final  List<String> _category;
@override@JsonKey() List<String> get category {
  if (_category is EqualUnmodifiableListView) return _category;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_category);
}

 final  List<String> _country;
@override@JsonKey() List<String> get country {
  if (_country is EqualUnmodifiableListView) return _country;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_country);
}

 final  List<String> _keywords;
@override@JsonKey() List<String> get keywords {
  if (_keywords is EqualUnmodifiableListView) return _keywords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_keywords);
}

@override final  String? language;
@override final  String? datatype;
@override@JsonKey() final  bool duplicate;

/// Create a copy of NewsArticle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsArticleCopyWith<_NewsArticle> get copyWith => __$NewsArticleCopyWithImpl<_NewsArticle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewsArticleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsArticle&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.content, content) || other.content == content)&&(identical(other.link, link) || other.link == link)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.sourceName, sourceName) || other.sourceName == sourceName)&&(identical(other.sourcePriority, sourcePriority) || other.sourcePriority == sourcePriority)&&(identical(other.sourceUrl, sourceUrl) || other.sourceUrl == sourceUrl)&&(identical(other.sourceIcon, sourceIcon) || other.sourceIcon == sourceIcon)&&const DeepCollectionEquality().equals(other._creator, _creator)&&(identical(other.pubDate, pubDate) || other.pubDate == pubDate)&&(identical(other.pubDateTZ, pubDateTZ) || other.pubDateTZ == pubDateTZ)&&(identical(other.fetchedAt, fetchedAt) || other.fetchedAt == fetchedAt)&&const DeepCollectionEquality().equals(other._category, _category)&&const DeepCollectionEquality().equals(other._country, _country)&&const DeepCollectionEquality().equals(other._keywords, _keywords)&&(identical(other.language, language) || other.language == language)&&(identical(other.datatype, datatype) || other.datatype == datatype)&&(identical(other.duplicate, duplicate) || other.duplicate == duplicate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,articleId,title,description,content,link,imageUrl,videoUrl,sourceId,sourceName,sourcePriority,sourceUrl,sourceIcon,const DeepCollectionEquality().hash(_creator),pubDate,pubDateTZ,fetchedAt,const DeepCollectionEquality().hash(_category),const DeepCollectionEquality().hash(_country),const DeepCollectionEquality().hash(_keywords),language,datatype,duplicate]);

@override
String toString() {
  return 'NewsArticle(articleId: $articleId, title: $title, description: $description, content: $content, link: $link, imageUrl: $imageUrl, videoUrl: $videoUrl, sourceId: $sourceId, sourceName: $sourceName, sourcePriority: $sourcePriority, sourceUrl: $sourceUrl, sourceIcon: $sourceIcon, creator: $creator, pubDate: $pubDate, pubDateTZ: $pubDateTZ, fetchedAt: $fetchedAt, category: $category, country: $country, keywords: $keywords, language: $language, datatype: $datatype, duplicate: $duplicate)';
}


}

/// @nodoc
abstract mixin class _$NewsArticleCopyWith<$Res> implements $NewsArticleCopyWith<$Res> {
  factory _$NewsArticleCopyWith(_NewsArticle value, $Res Function(_NewsArticle) _then) = __$NewsArticleCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'article_id') String articleId, String title, String? description, String? content, String? link,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'video_url') String? videoUrl,@JsonKey(name: 'source_id') String? sourceId,@JsonKey(name: 'source_name') String sourceName,@JsonKey(name: 'source_priority') int sourcePriority,@JsonKey(name: 'source_url') String? sourceUrl,@JsonKey(name: 'source_icon') String? sourceIcon, List<String> creator,@JsonKey(name: 'pubDate', fromJson: _dateTimeFromJson) DateTime? pubDate,@JsonKey(name: 'pubDateTZ') String? pubDateTZ,@JsonKey(name: 'fetched_at') String? fetchedAt, List<String> category, List<String> country, List<String> keywords, String? language, String? datatype, bool duplicate
});




}
/// @nodoc
class __$NewsArticleCopyWithImpl<$Res>
    implements _$NewsArticleCopyWith<$Res> {
  __$NewsArticleCopyWithImpl(this._self, this._then);

  final _NewsArticle _self;
  final $Res Function(_NewsArticle) _then;

/// Create a copy of NewsArticle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? articleId = null,Object? title = null,Object? description = freezed,Object? content = freezed,Object? link = freezed,Object? imageUrl = freezed,Object? videoUrl = freezed,Object? sourceId = freezed,Object? sourceName = null,Object? sourcePriority = null,Object? sourceUrl = freezed,Object? sourceIcon = freezed,Object? creator = null,Object? pubDate = freezed,Object? pubDateTZ = freezed,Object? fetchedAt = freezed,Object? category = null,Object? country = null,Object? keywords = null,Object? language = freezed,Object? datatype = freezed,Object? duplicate = null,}) {
  return _then(_NewsArticle(
articleId: null == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,sourceId: freezed == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String?,sourceName: null == sourceName ? _self.sourceName : sourceName // ignore: cast_nullable_to_non_nullable
as String,sourcePriority: null == sourcePriority ? _self.sourcePriority : sourcePriority // ignore: cast_nullable_to_non_nullable
as int,sourceUrl: freezed == sourceUrl ? _self.sourceUrl : sourceUrl // ignore: cast_nullable_to_non_nullable
as String?,sourceIcon: freezed == sourceIcon ? _self.sourceIcon : sourceIcon // ignore: cast_nullable_to_non_nullable
as String?,creator: null == creator ? _self._creator : creator // ignore: cast_nullable_to_non_nullable
as List<String>,pubDate: freezed == pubDate ? _self.pubDate : pubDate // ignore: cast_nullable_to_non_nullable
as DateTime?,pubDateTZ: freezed == pubDateTZ ? _self.pubDateTZ : pubDateTZ // ignore: cast_nullable_to_non_nullable
as String?,fetchedAt: freezed == fetchedAt ? _self.fetchedAt : fetchedAt // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self._category : category // ignore: cast_nullable_to_non_nullable
as List<String>,country: null == country ? _self._country : country // ignore: cast_nullable_to_non_nullable
as List<String>,keywords: null == keywords ? _self._keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,datatype: freezed == datatype ? _self.datatype : datatype // ignore: cast_nullable_to_non_nullable
as String?,duplicate: null == duplicate ? _self.duplicate : duplicate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
