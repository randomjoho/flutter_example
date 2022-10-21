// ignore_for_file: avoid_classes_with_only_static_members
import 'package:example/data/local/data_base.dart';
import 'package:example/data/local/model/home_search.dart';
import 'package:example/data/remote/home/response/detail_info.dart';
import 'package:example/objectbox.g.dart';

class SearchDao {
  static saveData(List<HomeSearchModel> list) {
    try {
      final Box<HomeSearchModel> searchBox =
          AppDataBase.store.box<HomeSearchModel>();

      list.forEach((HomeSearchModel element) async {
        final HomeSearchModel? result = searchBox
            .query(HomeSearchModel_.appId.equals(element.appId))
            .build()
            .findFirst();

        await searchBox.putAsync(element.copyWith(id: result?.id ?? 0),
            mode: result != null ? PutMode.update : PutMode.insert);
      });
    } catch (e) {
      print('插入数据错误 $e');
    }
  }

  static List<HomeSearchModel> search(String key) {
    if (key.isEmpty) {
      return [];
    }

    try {
      final Box<HomeSearchModel> searchBox =
          AppDataBase.store.box<HomeSearchModel>();

      final query = searchBox
          .query(HomeSearchModel_.name
              .contains(key)
              .or(HomeSearchModel_.summary.contains(key))
              .or(HomeSearchModel_.artist.contains(key)))
          .build();

      final List<HomeSearchModel> results = query.find();

      print('result ${results.length}');
      query.close();
      return results;
    } catch (e) {
      print('插入数据错误 $e');
      return [];
    }
  }

  static void updateDetail(DetailInfo info) async {
    try {
      final Box<HomeSearchModel> searchBox =
          AppDataBase.store.box<HomeSearchModel>();

      final Query<HomeSearchModel> query = searchBox
          .query(HomeSearchModel_.appId.equals(info.trackId.toString()))
          .build();
      final List<HomeSearchModel> results = query.find();
      query.close();
      if (results.isNotEmpty) {
        final HomeSearchModel data = results.first.copyWith(
          userRatingCountForCurrentVersion:
              info.userRatingCountForCurrentVersion,
          averageUserRatingForCurrentVersion:
              info.averageUserRatingForCurrentVersion,
        );
        searchBox.putAsync(data, mode: PutMode.update);
      }
    } catch (e) {
      print('更新数据错误 $e');
    }
  }
}
