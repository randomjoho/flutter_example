import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

typedef OnLoad = Future<LoadingResult> Function(int page);

enum LoadingResult {
  hasMore,
  hasDataButNoMore,
  noData,
}

class AppRefresh extends StatefulWidget {
  const AppRefresh({
    Key? key,
    this.controller,
    this.scrollController,
    this.header,
    this.footer,
    required this.child,
    this.enableRefresh = true,
    this.enableLoadMore = true,
    this.firstRefresh = false,
    required this.onLoad,
    this.emptyWidget,
  })  : scrollDirection = Axis.vertical,
        shrinkWrap = true,
        slivers = null,
        super(key: key);

  const AppRefresh.custom({
    Key? key,
    this.controller,
    this.scrollController,
    this.scrollDirection = Axis.vertical,
    this.shrinkWrap = false,
    this.header,
    this.footer,
    required this.slivers,
    this.enableRefresh = true,
    this.enableLoadMore = true,
    this.firstRefresh = false,
    required this.onLoad,
    this.emptyWidget,
  })  : child = null,
        super(key: key);

  static const firstPage = 1;
  static const pageSize = 10;

  final EasyRefreshController? controller;
  final ScrollController? scrollController;
  final Axis scrollDirection;
  final bool shrinkWrap;
  final Header? header;
  final Footer? footer;
  final Widget? emptyWidget;

  // Slivers集合
  final List<Widget>? slivers;
  final Widget? child;

  final bool enableRefresh;
  final bool enableLoadMore;
  final bool firstRefresh;
  final OnLoad onLoad;

  @override
  State<StatefulWidget> createState() {
    return _AppRefreshState();
  }
}

class _AppRefreshState extends State<AppRefresh> {
  int _page = 0;

  late EasyRefreshController controller;

  @override
  void initState() {
    super.initState();

    controller = widget.controller ?? EasyRefreshController();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) =>
        widget.enableRefresh && widget.firstRefresh
            ? controller.callRefresh()
            : null);
  }

  @override
  void didUpdateWidget(covariant AppRefresh oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.controller != oldWidget.controller) {
      controller = widget.controller ?? EasyRefreshController();
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.slivers != null) {
      return EasyRefresh.custom(
        controller: controller,
        onRefresh: widget.enableRefresh ? _onRefresh : null,
        onLoad: widget.enableLoadMore ? _onLoading : null,
        enableControlFinishRefresh: true,
        enableControlFinishLoad: true,
        header: widget.header,
        footer: widget.footer,
        emptyWidget: widget.emptyWidget,
        scrollDirection: widget.scrollDirection,
        scrollController: widget.scrollController,
        shrinkWrap: widget.shrinkWrap,
        slivers: widget.slivers,
      );
    }
    return EasyRefresh(
      controller: controller,
      onRefresh: widget.enableRefresh ? _onRefresh : null,
      onLoad: widget.enableLoadMore ? _onLoading : null,
      enableControlFinishRefresh: true,
      enableControlFinishLoad: true,
      scrollController: widget.scrollController,
      header: widget.header,
      footer: widget.footer,
      emptyWidget: widget.emptyWidget,
      child: widget.child,
    );
  }

  Future<void> _onRefresh() async {
    try {
      final result = await _loadPage(AppRefresh.firstPage);

      if (mounted == false) {
        return;
      }

      if (result != LoadingResult.hasDataButNoMore) {
        controller.resetLoadState();
      }

      controller.finishRefresh();
    } catch (error) {
      print('加载时出错 $error');

      if (mounted == false) {
        return;
      }

      controller.finishRefresh(success: false);
      rethrow;
    }
  }

  Future<void> _onLoading() async {
    try {
      final result = await _loadPage(_page + 1);

      if (mounted == false) {
        return;
      }

      controller.finishLoad(noMore: result != LoadingResult.hasMore);
    } catch (error) {
      print('加载时出错 $error');

      if (mounted == false) {
        return;
      }

      controller.finishLoad(success: false);
    }
  }

  Future<LoadingResult> _loadPage(int nextPage) async {
    try {
      LoadingResult result;
      result = await widget.onLoad(nextPage);
      if (result != LoadingResult.noData) {
        _page = nextPage;
      }

      return result;
    } catch (error, stack) {
      print('refresh error $error $stack');
      return LoadingResult.noData;
    }
  }
}
