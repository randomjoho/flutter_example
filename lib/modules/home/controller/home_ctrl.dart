import 'package:dio/src/cancel_token.dart';
import 'package:example/base/base_controller.dart';
import 'package:example/data/local/search_dao.dart';
import 'package:example/data/remote/home/response/detail_info.dart';
import 'package:example/data/remote/home/response/recommend_resp.dart';
import 'package:example/modules/home/repo/home_repo.dart';
import 'package:example/widget/app_refresh.dart';
import 'package:get/get.dart';

class HomeCtrl extends BaseController {
  HomeCtrl({
    required HomeRepo homeRepo,
  }) {
    _repository = homeRepo;
  }
  static HomeCtrl get to => Get.find();

  late final HomeRepo _repository;

  final List<RecommendEntry> _topFreeSourceList = <RecommendEntry>[];

  final RxList<RecommendEntry> _recommendList = <RecommendEntry>[].obs;
  final RxList<RecommendEntry> _topFreeList = <RecommendEntry>[].obs;

  RxList<RecommendEntry> getRecommendList() {
    return _recommendList;
  }

  RxList<RecommendEntry> getTopFreeList() {
    return _topFreeList;
  }

  void updateInfo(String id) {
    completeFetch(id, (CancelToken token) => _repository.updateInfo(id, token))
        .then(refreshData);
  }

  @override
  void onInit() {
    super.onInit();

    callDataService(loadPage(AppRefresh.firstPage));
  }

  Future<LoadingResult> loadPageWithView(int page) async {
    return await callDataService<LoadingResult>(loadPage(page));
  }

  Future<LoadingResult> loadPage(int page) async {
    List<RecommendEntry> result = [];

    if (page == AppRefresh.firstPage) {
      _recommendList.assignAll(await _repository.loadRecommendData());
      _topFreeList.clear();
    }

    if (_topFreeSourceList.isEmpty) {
      _topFreeSourceList.assignAll(await _repository.loadTopFreeData());
    }

    if (_topFreeSourceList.isNotEmpty) {
      const int pageSize = 10;
      final int startIndex = (page - 1) * 10;
      if (startIndex >= _topFreeSourceList.length) {
        return LoadingResult.noData;
      }
      result = _topFreeSourceList.sublist(startIndex, startIndex + pageSize);
    }

    _topFreeList.addAll(result);

    _repository.insertToDataBase(result);

    if (result.isNotEmpty) {
      return result.length == AppRefresh.pageSize
          ? LoadingResult.hasMore
          : LoadingResult.hasDataButNoMore;
    } else {
      return LoadingResult.noData;
    }
  }

  void refreshData(DetailInfo value) {
    final int index = _topFreeList.indexWhere(
        (RecommendEntry element) => element.appId == value.trackId.toString());
    if (index != -1) {
      _topFreeList[index] = _topFreeList[index].copyWith(
        userRatingCountForCurrentVersion:
            value.userRatingCountForCurrentVersion,
        averageUserRatingForCurrentVersion:
            value.averageUserRatingForCurrentVersion,
      );
    }

    SearchDao.updateDetail(value);
  }

  @override
  void retry() {
    callDataService(loadPage(AppRefresh.firstPage));
  }
}
