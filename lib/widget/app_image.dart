// ignore_for_file: avoid_classes_with_only_static_members
import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.needCache = true,
    this.maxBytes = 50,
    this.compressionRatio = 0.7,
  });
  final double? width;
  final double? height;
  final String imageUrl;
  final BoxFit? fit;
  final bool needCache;
  // default 50KB
  final int? maxBytes;
  final double? compressionRatio;

  @override
  Widget build(BuildContext context) {
    return _imageByUrl(imageUrl);
  }

  Widget _imageByUrl(String path) {
    if (path.startsWith('http')) {
      return ExtendedImage.network(
        path,
        fit: fit,
        width: width,
        height: height,
        cacheWidth: width?.toInt(),
        cacheHeight: height?.toInt(),
        maxBytes: maxBytes,
        compressionRatio: compressionRatio,
        cache: needCache,
        loadStateChanged: (ExtendedImageState state) {
          switch (state.extendedImageLoadState) {
            case LoadState.loading:
              Container(
                color: Colors.grey.shade200,
                width: width,
                height: height,
              );
              break;
            case LoadState.completed:
              return state.completedWidget;
            case LoadState.failed:
              return GestureDetector(
                onTap: () => state.reLoadImage(),
                child: _errorWidget(),
              );
          }
        },
      );
    } else if (path.startsWith('assets')) {
      return Image.asset(
        path,
        fit: fit,
        width: width,
        height: height,
        errorBuilder: (context, object, stackTrace) {
          return _errorWidget();
        },
      );
    } else {
      return Image.file(
        File(path),
        fit: fit,
        width: width,
        height: height,
        errorBuilder: (context, object, stackTrace) {
          return _errorWidget();
        },
      );
    }
  }

  Widget _errorWidget() {
    return ColoredBox(
      color: Colors.grey.shade200,
      child: const Icon(Icons.error_outline_outlined),
    );
  }
}
