import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:example/data/local/model/home_search.dart';
import 'package:example/data/local/search_dao.dart';
import 'package:example/data/remote/home/home_client.dart';
import 'package:example/data/remote/home/response/detail_info.dart';
import 'package:example/data/remote/home/response/detail_info_resp.dart';
import 'package:example/data/remote/home/response/recommend_resp.dart';

import 'home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<List<RecommendEntry>> loadRecommendData() {
    return HomeClient.acquire
        .recommendList()
        .then((String value) => RecommendResp.fromJson(jsonDecode(value)))
        .then((RecommendResp value) {
      final List<RecommendEntry> data = value.feed.entry;
      insertToDataBase(data);
      return data;
    });
  }

  @override
  Future<List<RecommendEntry>> loadTopFreeData() {
    // 由于API不支持分页加载，所以先获取100条然后模拟分页
    return HomeClient.acquire
        .topFreeList(limit: 100)
        .then((String value) => RecommendResp.fromJson(jsonDecode(value)))
        .then((RecommendResp value) {
      final List<RecommendEntry> data = value.feed.entry;
      insertToDataBase(data);
      return data;
    });
  }

  @override
  Future<void> insertToDataBase(List<RecommendEntry> list) async {
    final List<HomeSearchModel> dataList = list
        .map((RecommendEntry e) => e.toSearchModel())
        .toList(growable: false);
    SearchDao.saveData(dataList);
  }

  @override
  Future<DetailInfo> updateInfo(String id, CancelToken? token) {
    return HomeClient.acquire
        .lookUp(id: id, cancelToken: token)
        .then((String value) => DetailInfoResp.fromJson(jsonDecode(value)))
        .then((DetailInfoResp value) => value.results.first);
  }
}
