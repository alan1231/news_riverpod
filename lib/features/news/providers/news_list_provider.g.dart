// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 列表状态控制器：管理分类切换、刷新与列表请求。

@ProviderFor(NewsList)
final newsListProvider = NewsListProvider._();

/// 列表状态控制器：管理分类切换、刷新与列表请求。
final class NewsListProvider
    extends $AsyncNotifierProvider<NewsList, List<NewsArticle>> {
  /// 列表状态控制器：管理分类切换、刷新与列表请求。
  NewsListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'newsListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$newsListHash();

  @$internal
  @override
  NewsList create() => NewsList();
}

String _$newsListHash() => r'a84c51dd17b8c8e3ffb499d6a9b3f36690b63dec';

/// 列表状态控制器：管理分类切换、刷新与列表请求。

abstract class _$NewsList extends $AsyncNotifier<List<NewsArticle>> {
  FutureOr<List<NewsArticle>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<NewsArticle>>, List<NewsArticle>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<NewsArticle>>, List<NewsArticle>>,
              AsyncValue<List<NewsArticle>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
