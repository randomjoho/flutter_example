import 'package:example/base/base_view.dart';
import 'package:example/data/remote/home/response/recommend_resp.dart';
import 'package:example/modules/home/controller/home_ctrl.dart';
import 'package:example/modules/home/widget/recommend_item.dart';
import 'package:example/modules/home/widget/top_free_item.dart';
import 'package:example/routes/routes.dart';
import 'package:example/routes/src/home_route.dart';
import 'package:example/widget/app_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:get/get.dart';

/// 应用首页 [搜索，推荐列表，下载排行表]
class HomePage extends BaseView<HomeCtrl> {
  HomePage({super.key});

  @override
  Widget body(BuildContext context) {
    return Column(
      children: <Widget>[
        _searchWidget(context),
        const Divider(
          height: 5,
          thickness: 1,
        ),
        Expanded(child: _refreshWidget(context))
      ],
    );
  }

  Widget _searchWidget(BuildContext context) {
    return GestureDetector(
      onTap: () => AppRoutes.toNamed(HomeRoutes.search),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.grey.withOpacity(0.2),
        ),
        child: Row(
          children: <Widget>[
            const Icon(
              Icons.search,
              color: Colors.grey,
              size: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Search ...',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _recommendWidget(BuildContext context) {
    const double padding = 25.0;
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Recommend',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          SizedBox(
            height: Get.width * 0.38,
            child: Obx(() {
              final List<RecommendEntry> list = controller.getRecommendList();
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  final RecommendEntry model = list[index];
                  return RecommendItem(model: model);
                },
                separatorBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return const SizedBox(
                    width: padding,
                  );
                },
                itemCount: list.length,
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _refreshWidget(BuildContext context) {
    return Obx(() {
      final RxList<RecommendEntry> list = controller.getTopFreeList();

      return AppRefresh(
        header: BallPulseHeader(),
        footer: BallPulseFooter(enableHapticFeedback: false),
        onLoad: controller.loadPageWithView,
        // firstRefresh: true,
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return _recommendWidget(context);
            }

            final RecommendEntry model = list[index - 1];
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TopFreeItem(
                  index: index,
                  model: model.toSearchModel(),
                ));
          },
          separatorBuilder: (
            BuildContext ctx,
            int index,
          ) {
            return Container(
              height: 1,
              color: Theme.of(context).dividerColor,
            );
          },
          itemCount: list.length + 1,
        ),
      );
    });
  }

  @override
  Function? retry() {
    print('home retry');
  }
}
