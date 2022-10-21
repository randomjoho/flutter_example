import 'package:example/data/local/model/home_search.dart';
import 'package:example/modules/home/controller/home_ctrl.dart';
import 'package:example/modules/home/controller/search_ctrl.dart';
import 'package:example/widget/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class TopFreeItem extends StatelessWidget {
  const TopFreeItem({
    super.key,
    required this.model,
    this.index,
  });

  final HomeSearchModel model;
  final int? index;

  @override
  Widget build(BuildContext context) {
    final double iconWidth = Get.width * 0.17;

    // 更新星级
    if (model.averageUserRatingForCurrentVersion == null) {
      index != null
          ? HomeCtrl.to.updateInfo(model.appId)
          : SearchCtrl.to.updateInfo(model.appId);
    }

    return SizedBox(
      height: Get.width * 0.24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (index != null)
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                '$index',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.grey),
              ),
            ),
          ClipOval(
            child: AppImage(
              imageUrl: model.icon,
              width: iconWidth,
              height: iconWidth,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: SizedBox(
            height: iconWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  model.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black),
                ),
                Text(
                  model.category,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.grey),
                ),
                if (model.averageUserRatingForCurrentVersion != null)
                  Row(
                    children: <Widget>[
                      RatingBar.builder(
                        initialRating:
                            model.averageUserRatingForCurrentVersion ?? 0.0,
                        itemSize: 12,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (double rating) {
                          print(rating);
                        },
                      ),
                      Text(
                        ' (${model.userRatingCountForCurrentVersion ?? 0})',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.grey),
                      )
                    ],
                  )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
