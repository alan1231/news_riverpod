/// 統一的介面異常類型：
/// - message：給 UI 層展示的可讀錯誤資訊
/// - statusCode：可選 HTTP 狀態碼，方便後續做分支處理
class ApiException implements Exception {
  const ApiException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;

  /// 列印異常時直接輸出使用者可讀文案。
  @override
  String toString() => message;
}
