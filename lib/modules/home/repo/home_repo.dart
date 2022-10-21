import 'package:dio/dio.dart';
import 'package:example/data/remote/home/response/detail_info.dart';
import 'package:example/data/remote/home/response/recommend_resp.dart';

abstract class HomeRepo {
  Future<List<RecommendEntry>> loadRecommendData();
  Future<List<RecommendEntry>> loadTopFreeData();
  void insertToDataBase(List<RecommendEntry> list);
  Future<DetailInfo> updateInfo(String id, CancelToken? token);
}
