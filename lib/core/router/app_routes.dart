/// 集中管理路由路徑，避免頁面裡到處手寫字串。
class AppRoutes {
  const AppRoutes._();

  /// 新聞列表頁真實路徑。
  static const news = '/news';

  /// 新聞詳情頁路由樣板，`:id` 是路徑參數佔位符。
  static const newsDetail = '/news/:id';

  /// 根據新聞 id 生成真正用於跳轉的路徑。
  static String newsDetailPath(String id) => '/news/$id';
}
