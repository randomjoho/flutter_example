class HomeApi {
  /// 首页推荐应用列表
  static const String recommendList =
      '/hk/rss/topgrossingapplications/limit={limit}/json';

  /// 免费排行
  static const String topFreeList =
      '/hk/rss/topfreeapplications/limit={limit}/json';

  /// 应用详情
  static const String lookUp = '/hk/lookup?id={id}';
}
