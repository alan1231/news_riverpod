import 'package:dio/dio.dart';
import 'package:flutter_news_riverpod_start/core/network/api_exception.dart';

/// 將底層網路異常統一映射為業務可消費的 ApiException。
///
/// 這樣 UI 和 Provider 層只處理一種錯誤模型，不直接依賴 Dio 細節。
ApiException mapNetworkError(Object error) {
  // 已經是業務異常時直接透傳，避免重複包裝。
  if (error is ApiException) {
    return error;
  }

  if (error is DioException) {
    final statusCode = error.response?.statusCode;

    // 按 Dio 的異常類型映射成使用者可讀文案。
    return ApiException(switch (error.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout => '網路逾時，請稍後重試',
      DioExceptionType.badResponse => '服務暫時無法使用',
      DioExceptionType.connectionError => '網路連線失敗，請檢查網路',
      DioExceptionType.cancel => '請求已取消',
      _ => '網路異常，請稍後重試',
    }, statusCode: statusCode);
  }

  // 非 Dio 異常也要兜底，避免向頁面拋出不可讀錯誤。
  return const ApiException('未知錯誤，請稍後重試');
}
