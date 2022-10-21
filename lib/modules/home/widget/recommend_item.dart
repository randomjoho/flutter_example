import 'package:example/data/remote/home/response/recommend_resp.dart';
import 'package:example/widget/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendItem extends StatelessWidget {
  const RecommendItem({Key? key, required this.model}) : super(key: key);

  final RecommendEntry model;
  @override
  Widget build(BuildContext context) {
    const double padding = 25.0;
    // 默认展示3.5个应用
    final width = (Get.width - padding * 4) / 3.5;

    return SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (model.images.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: AppImage(
                imageUrl: model.images.last.label,
                width: width,
                height: width,
              ),
            ),
          const SizedBox(
            height: 5,
          ),
          Text(
            model.name.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.black, height: 20 / 14),
          ),
          Text(
            model.category.attributes.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.grey, height: 20 / 14),
          )
        ],
      ),
    );
  }
}
