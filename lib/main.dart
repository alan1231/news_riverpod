import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';

void main() {
  // ProviderScope 是 Riverpod 的根容器，所有 Provider 都需要它。
  runApp(const ProviderScope(child: NewsApp()));
}

/// 應用根元件，負責掛載主題與路由。
class NewsApp extends ConsumerWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 從 Riverpod 讀取 GoRouter 物件。
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'News Course',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff2563eb)),
        useMaterial3: true,
      ),
      // 將 go_router 交給 MaterialApp.router 管理導覽。
      routerConfig: router,
    );
  }
}
