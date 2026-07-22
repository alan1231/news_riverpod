import 'package:dio/dio.dart';

/// Dio 工廠：
/// 統一建立 HTTP 客戶端，集中管理逾時、基礎位址與預設請求標頭。
class DioClient {
  const DioClient._();

  /// API 根位址，所有請求 path 都會拼接在該位址之後。
  static const baseUrl = 'https://newsdata.io';

  /// 建立一個具備預設網路設定的 Dio 實例。
  static Dio create() {
    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        // 連線逾時：建立 TCP/SSL 連線的最長等待時間。
        connectTimeout: const Duration(seconds: 10),
        // 接收逾時：伺服器回傳資料的最長等待時間。
        receiveTimeout: const Duration(seconds: 30),
        // 傳送逾時：上傳請求本文的最長等待時間。
        sendTimeout: const Duration(seconds: 30),
        responseType: ResponseType.json,
        contentType: Headers.jsonContentType,
        headers: const {'Accept': 'application/json'},
      ),
    );
  }
}
