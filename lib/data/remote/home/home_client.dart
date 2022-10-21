import 'package:dio/dio.dart';
import 'package:example/http/apis/home/home_api.dart';
import 'package:example/http/dio_utils.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'home_client.g.dart';

@RestApi(baseUrl: '')
abstract class HomeClient {
  factory HomeClient(Dio dio, {String? baseUrl}) {
    return _cache.putIfAbsent(baseUrl, () {
      return _HomeClient(dio, baseUrl: baseUrl);
    });
  }

  static final _cache = <String?, HomeClient>{};

  static HomeClient get acquire {
    return HomeClient(DioUtils.dio);
  }

  // 由於接口的contentType不是json，所以返回使用String

  @GET(HomeApi.recommendList)
  Future<String> recommendList({
    @DioOptions() Options? options,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
    @Path('limit') int limit = 10,
  });

  @GET(HomeApi.topFreeList)
  Future<String> topFreeList({
    @DioOptions() Options? options,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
    @Path('limit') int limit = 10,
  });

  @GET(HomeApi.lookUp)
  Future<String> lookUp({
    @DioOptions() Options? options,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
    @Path('id') required String id,
  });
}
