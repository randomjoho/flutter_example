import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

mixin FetchCompleterGetMixin on GetLifeCycle {
  final Map<Object, CancelToken> _tokenSet = <Object, CancelToken>{};
  final Map<Object, Completer<dynamic>> _completerSet =
      <Object, Completer<dynamic>>{};

  @override
  void onClose() {
    cancelAllFetches();

    super.onClose();
  }

  bool isFetching(Object key) {
    return _completerSet.containsKey(key);
  }

  CancelToken? cancelFetch(Object key) {
    _completerSet.remove(key);
    return _tokenSet.remove(key);
  }

  void cancelAllFetches() {
    for (final CancelToken token in _tokenSet.values) {
      token.cancel();
    }
  }

  Future<R> completeFetch<R>(
    Object key,
    Future<R> Function(CancelToken token) runner, {
    // 是否取消之前的run，重新运行
    bool force = false,
  }) {
    Completer<R>? completer;

    if (force) {
      cancelFetch(key);
    } else {
      completer = _completerSet[key] as Completer<R>?;
      if (completer != null) {
        return completer.future;
      }
    }

    final CancelToken token = _tokenSet[key] = CancelToken();
    completer = _completerSet[key] = Completer<R>()
      ..complete(Future<R>.sync(() => runner(token)))
      ..future.whenComplete(() {
        _tokenSet.remove(key);
        _completerSet.remove(key);
      });

    return completer.future;
  }
}
