import 'dart:async';

import 'package:dio/dio.dart';
import 'package:example/base/page_state.dart';
import 'package:example/http/exceptions/api_exception.dart';
import 'package:example/http/exceptions/app_exception.dart';
import 'package:example/http/exceptions/json_format_exception.dart';
import 'package:example/http/exceptions/network_exception.dart';
import 'package:example/http/exceptions/not_found_exception.dart';
import 'package:example/http/exceptions/service_unavailable_exception.dart';
import 'package:example/http/exceptions/unauthorize_exception.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../utils/fetch_completer_get.dart';

abstract class BaseController extends GetxController
    with FetchCompleterGetMixin {
  AppLocalizations get l10n => AppLocalizations.of(Get.context!)!;

  final Rx<PageState> _pageSateController = PageState.DEFAULT.obs;

  PageState get pageState => _pageSateController.value;

  PageState updatePageState(PageState state) => _pageSateController(state);

  PageState resetPageState() => _pageSateController(PageState.DEFAULT);

  void retry();

  void showLoading() => updatePageState(PageState.LOADING);

  void hideLoading() => resetPageState();

  final RxString _messageController = ''.obs;

  String get message => _messageController.value;

  String showMessage(String msg) => _messageController(msg);

  final RxString _errorMessageController = ''.obs;

  String get errorMessage => _errorMessageController.value;

  void showErrorMessage(String msg) {
    _errorMessageController(msg);
  }

  final RxString _successMessageController = ''.obs;

  String get successMessage => _messageController.value;

  String showSuccessMessage(String msg) => _successMessageController(msg);

  dynamic callDataService<T>(
    Future<T> future, {
    Function(Exception exception)? onError,
    Function(T response)? onSuccess,
    Function()? onStart,
    Function()? onComplete,
  }) async {
    Exception? exception;

    onStart == null ? showLoading() : onStart();

    try {
      final T response = await future;

      if (onSuccess != null) onSuccess(response);

      onComplete == null ? hideLoading() : onComplete();
      _errorMessageController.value = '';
      return response;
    } on ServiceUnavailableException catch (exp) {
      exception = exp;
      showErrorMessage(exp.message);
    } on UnauthorizedException catch (exp) {
      exception = exp;
      showErrorMessage(exp.message);
    } on TimeoutException catch (exp) {
      exception = exp;
      showErrorMessage(exp.message ?? 'Timeout exception');
    } on NetworkException catch (exp) {
      exception = exp;
      showErrorMessage(exp.message);
    } on JsonFormatException catch (exp) {
      exception = exp;
      showErrorMessage(exp.message);
    } on NotFoundException catch (exp) {
      exception = exp;
      showErrorMessage(exp.message);
    } on ApiException catch (exp) {
      exception = exp;
    } on AppException catch (exp) {
      exception = exp;
      showErrorMessage(exp.message);
    } on DioError catch (exp) {
      exception = exp;
      showErrorMessage(exp.message);
    } catch (error) {
      exception = AppException(message: '$error');
      print('Controller>>>>>> error $error');
    }

    if (onError != null) onError(exception);

    onComplete == null ? hideLoading() : onComplete();
  }

  @override
  void onClose() {
    _messageController.close();
    _pageSateController.close();
    super.onClose();
  }
}
