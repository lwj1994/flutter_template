import 'dart:convert';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:temple/data/network/api.dart';
import 'package:uizakura/uizakura.dart';

import 'bean.dart';

/// @author luwenjie on 2024/2/26 21:05:25

class NetworkManager {
  late ApiService _api;

  ApiService get api => _api;
  final NetworkConfig defaultConfig = NetworkConfig(
      baseUrl: "http://59.110.230.165:8023",
      httpProxy: LuAppEnv.isDebug ? "127.0.0.1:9090" : "");
  static NetworkManager? _instance;

  static NetworkManager get instance => _checkInstance();

  NetworkManager._();

  static NetworkManager _checkInstance() {
    _instance ??= NetworkManager._();
    return _instance!;
  }

  void initialize() {
    final NetworkConfig config = defaultConfig;
    HttpOverrides.global = _HttpOverrides(config.httpProxy);
    _api = ApiService.create(ChopperClient(baseUrl: Uri.parse(config.baseUrl)));
  }

  ApiResponse<dynamic> parseEchoApiResponse({
    required Response<dynamic> response,
  }) {
    String msg = "";
    String code = ApiService.codeNone.toString();
    dynamic data = response.error ?? response.body;
    if (data == null) {
      return const ApiResponse<dynamic>();
    }
    if (data is String) {
      try {
        data = jsonDecode(data);
      } catch (e) {
        //
      }
    }
    if (data is Map) {
      try {
        msg = (data["message"] ?? data["msg"])?.toString() ?? "";
        code = (data["code"] ?? data["status"])?.toString() ??
            ApiService.codeNone.toString();
        return ApiResponse<dynamic>(code: code, msg: msg);
      } catch (e) {
        //
      }
    }
    return const ApiResponse<dynamic>();
  }

  HttpExceptionErrorMessage buildHttpExceptionErrorMessage({
    required Response<dynamic> response,
  }) {
    final ApiResponse<dynamic> echoApiResponse =
        parseEchoApiResponse(response: response);
    final String echoCode = echoApiResponse.code.toString();
    final String echoMsg = echoApiResponse.msg;
    int? statusCode;
    String reqId = "";
    String traceId = "";
    String msg = "";
    dynamic data;
    final HttpExceptionErrorMessage emptyMsg =
        HttpExceptionErrorMessage(message: "", bizMessage: "");
    statusCode = response.statusCode;
    msg = "httpStatus ${response.statusCode}";
    data = response.error ?? response.body;

    if (echoCode == ApiService.codeNone && statusCode < 400) {
      msg = "";
      return HttpExceptionErrorMessage(
        message: msg,
        bizMessage: msg,
        bizCode: echoCode,
      );
    }
    if (ApiService.isSuccess(echoCode)) {
      msg = "";
      return HttpExceptionErrorMessage(
        message: msg,
        bizMessage: msg,
        bizCode: echoCode,
      );
    }

    if (reqId.isNotEmpty) {
      msg += "\nrequestId:$reqId";
    }
    if (traceId.isNotEmpty) {
      msg += "\ntraceId:$traceId";
    }
    if (echoMsg.isNotEmpty) {
      msg += "\nbizError: $echoCode, $echoMsg";
    }

    msg += "\nresponse: ${data ?? ""}";
    return HttpExceptionErrorMessage(
      message: msg,
      bizMessage: echoMsg,
      bizCode: echoCode,
    );
  }
}

class _HttpOverrides extends HttpOverrides {
  final String httpProxy;

  _HttpOverrides(this.httpProxy);

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final HttpClient client = super.createHttpClient(context)
      ..findProxy = _findProxy;
    client.userAgent = Uri.encodeComponent(
        "smartproperty.${LuAppEnv.version}.${LuAppEnv.buildCode}.dart");
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    return client;
  }

  String _findProxy(Uri url) {
    return HttpClient.findProxyFromEnvironment(
      url,
      environment: httpProxy.isNotEmpty
          ? <String, String>{
              'http_proxy': httpProxy,
              'https_proxy': httpProxy,
            }
          : <String, String>{},
    );
  }
}

class HttpExceptionErrorMessage {
  String message;
  String bizMessage;
  String bizCode;

  HttpExceptionErrorMessage(
      {this.message = "", this.bizMessage = "", this.bizCode = ""});
}
