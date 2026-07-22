import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_news_riverpod_start/core/router/app_router.dart';
import 'package:flutter_news_riverpod_start/main.dart';

void main() {
  testWidgets('NewsApp builds with a provider scope', (tester) async {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) =>
              const Scaffold(body: Center(child: Text('test home'))),
        ),
      ],
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [appRouterProvider.overrideWith((ref) => router)],
        child: const NewsApp(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('test home'), findsOneWidget);
  });
}
