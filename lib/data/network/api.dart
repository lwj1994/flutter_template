/// @author luwenjie on 2024/2/26 21:05:34
///
import 'dart:developer';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:temple/data/event.dart';
import 'package:temple/data/network/bean.dart';
import 'package:uizakura/uizakura.dart';

import 'manager.dart';

// part 'api.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  static const String codeSuccess = "0";
  static const String codeNone = "-999";
  static const String codeSuccess2 = "200";
  static const String codeSignError = "20000";

  static ApiService create([ChopperClient? client]) {
    return _$ApiService(client);
  }

  static bool isSuccess(String code) {
    return code == codeSuccess || code == codeSuccess2;
  }

  @Post(path: '/app-user/v1/register')
  Future<ApiResponse<dynamic>> userSignUp({
    @Field('areaCode') required String? areaCode,
    @Field('avatar') required String? avatar,
    @Field('fcmToken') required String? fcmToken,
    @Field('nric') required String? nric,
    @Field('password') required String? password,
    @Field('phone') required String? phone,
    @Field('plateNo') required String? plateNo,
    @Field('sex') required String? sex,
    @Field('userName') required String? userName,
  });
}

Future<Async<T>> executeApi<T>(Future<dynamic> Function() block,
    {bool showErrorToast = true}) async {
  try {
    dynamic res = await block.call();
    if (res is Response) {
      final int statusCode = res.statusCode;
      if (statusCode >= 200 && statusCode < 300) {
        return Async<T>.success();
      } else {
        return Async<T>.error(message: res.error.toString());
      }
    } else if (res is ApiResponse<T>) {
      String code = ApiService.codeNone;
      String msg = "";
      T? data;
      List<dynamic>? list;

      if (res.code != null && res.code != ApiService.codeNone) {
        code = res.code.toString();
      }
      msg = res.msg ?? "";
      data = res.data;
      list = res.list;
      if (ApiService.isSuccess(code)) {
        if (isTypeOf<T, ListPaging<dynamic>>()) {
          final T listPaging = ListPaging<dynamic>(
              isSuccess: true,
              items: list ?? <dynamic>[],
              total: res.total) as T;
          return Async<T>.success(data: listPaging, code: code);
        } else {
          return Async<T>.success(data: data, code: code);
        }
      } else {
        if (showErrorToast) {
          EventBus.send(ToastEvent(text: msg));
        }
        return Async<T>.error(message: msg, code: code);
      }
    }
    return Async<T>.success(data: res);
  } catch (e, stack) {
    if (e is SocketException) {
      return Async<T>.error(message: "");
    } else if (e is ChopperHttpException) {
      final HttpExceptionErrorMessage msg = NetworkManager.instance
          .buildHttpExceptionErrorMessage(response: e.response);
      if (showErrorToast) {
        EventBus.send(ToastEvent(text: msg.message));
      }
      // Logger.print(tagHttp,
      //     NetworkManager.instance.buildCurl(chopperResponse: e.response));
      return Async<T>.error(message: msg.bizMessage, code: msg.bizCode);
    } else {
      return Async<T>.error(message: "$e");
    }
  }
}
