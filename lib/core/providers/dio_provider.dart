import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../network/dio_client.dart';

// build_runner 會根據這個 part 生成 dioProvider。
part 'dio_provider.g.dart';

/// 全域 Dio Provider（常駐）：
/// - 統一對外提供 HTTP 客戶端
/// - 作為資料層請求入口依賴
@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  // API 層透過讀取這個 Provider 發起請求。
  return DioClient.create();
}
