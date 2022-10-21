import 'package:example/base/base_view.dart';
import 'package:example/data/local/model/home_search.dart';
import 'package:example/modules/home/controller/search_ctrl.dart';
import 'package:example/modules/home/example_page.dart';
import 'package:example/modules/home/widget/top_free_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 搜索页

class SearchPage extends BaseView<SearchCtrl> {
  SearchPage({super.key});

  Widget _searchResult(BuildContext context) {
    return Obx(() {
      final RxList<HomeSearchModel> list = controller.searchList;
      return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (
          BuildContext ctx,
          int index,
        ) {
          final HomeSearchModel model = list[index];
          return TopFreeItem(
            model: model,
          );
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
        itemCount: list.length,
      );
    });
  }

  Widget _searchWidget(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.grey.withOpacity(0.2)),
          child: Row(
            children: <Widget>[
              const Icon(
                Icons.search,
                color: Colors.grey,
                size: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: TextField(
                autofocus: true,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.grey),
                decoration: InputDecoration(
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.grey),
                    hintText: 'Search...',
                    contentPadding: EdgeInsets.zero,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    )),
                onChanged: (String str) {
                  controller.searchItem(str);
                },
              )),
            ],
          ),
        )),
        InkWell(
          onTap: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //关闭键盘
        final FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: Column(
        children: <Widget>[
          _searchWidget(context),
          InkWell(
            onTap: () {
              Get.offAll(const ExamplePage());
              // AppRoutes.toNamed(HomeRoutes.example);
            },
            child: const Text('Go Example Page'),
          ),
          Expanded(
            child: _searchResult(context),
          ),
        ],
      ),
    );
  }
}
