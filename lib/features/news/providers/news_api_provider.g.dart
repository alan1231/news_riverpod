// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_api_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 注入 NewsApi 单例，供列表与详情 Provider 复用。

@ProviderFor(newsApi)
final newsApiProvider = NewsApiProvider._();

/// 注入 NewsApi 单例，供列表与详情 Provider 复用。

final class NewsApiProvider
    extends $FunctionalProvider<NewsApi, NewsApi, NewsApi>
    with $Provider<NewsApi> {
  /// 注入 NewsApi 单例，供列表与详情 Provider 复用。
  NewsApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'newsApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$newsApiHash();

  @$internal
  @override
  $ProviderElement<NewsApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NewsApi create(Ref ref) {
    return newsApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NewsApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NewsApi>(value),
    );
  }
}

String _$newsApiHash() => r'c10bf7775676a598d03dda923108dd47913a58b0';

/// 非同步載入新聞列表，支援分頁。

@ProviderFor(newsList)
final newsListProvider = NewsListFamily._();

/// 非同步載入新聞列表，支援分頁。

final class NewsListProvider
    extends
        $FunctionalProvider<AsyncValue<NewsPage>, NewsPage, FutureOr<NewsPage>>
    with $FutureModifier<NewsPage>, $FutureProvider<NewsPage> {
  /// 非同步載入新聞列表，支援分頁。
  NewsListProvider._({
    required NewsListFamily super.from,
    required ({String query, String category, String? page}) super.argument,
  }) : super(
         retry: null,
         name: r'newsListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$newsListHash();

  @override
  String toString() {
    return r'newsListProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<NewsPage> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<NewsPage> create(Ref ref) {
    final argument =
        this.argument as ({String query, String category, String? page});
    return newsList(
      ref,
      query: argument.query,
      category: argument.category,
      page: argument.page,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NewsListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$newsListHash() => r'2cc5e9763b1ab26539adb5ac250c66d986264e48';

/// 非同步載入新聞列表，支援分頁。

final class NewsListFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<NewsPage>,
          ({String query, String category, String? page})
        > {
  NewsListFamily._()
    : super(
        retry: null,
        name: r'newsListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 非同步載入新聞列表，支援分頁。

  NewsListProvider call({
    String query = 'ai',
    String category = 'technology',
    String? page,
  }) => NewsListProvider._(
    argument: (query: query, category: category, page: page),
    from: this,
  );

  @override
  String toString() => r'newsListProvider';
}

/// 根據 ID 載入單篇新聞詳情。

@ProviderFor(newsDetail)
final newsDetailProvider = NewsDetailFamily._();

/// 根據 ID 載入單篇新聞詳情。

final class NewsDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<NewsArticle>,
          NewsArticle,
          FutureOr<NewsArticle>
        >
    with $FutureModifier<NewsArticle>, $FutureProvider<NewsArticle> {
  /// 根據 ID 載入單篇新聞詳情。
  NewsDetailProvider._({
    required NewsDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'newsDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$newsDetailHash();

  @override
  String toString() {
    return r'newsDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<NewsArticle> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<NewsArticle> create(Ref ref) {
    final argument = this.argument as String;
    return newsDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is NewsDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$newsDetailHash() => r'a6d2f87c2133c24c059dfde8022f869ec837b3f7';

/// 根據 ID 載入單篇新聞詳情。

final class NewsDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<NewsArticle>, String> {
  NewsDetailFamily._()
    : super(
        retry: null,
        name: r'newsDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 根據 ID 載入單篇新聞詳情。

  NewsDetailProvider call(String id) =>
      NewsDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'newsDetailProvider';
}
