import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';

import 'bean.dart';
import 'bean_json_adapter.dart';

/// @author luwenjie on 2024/2/20 16:26:40
///

@immutable
class AppJsonConverter extends JsonConverter {
  @override
  Request convertRequest(Request request) {
    request.parameters
        .removeWhere((String key, dynamic value) => value == null);
    if (request.body is Map<dynamic, dynamic>) {
      request = request.copyWith(
          body:
              Map<dynamic, dynamic>.from(request.body as Map<dynamic, dynamic>)
                ..removeWhere((dynamic key, dynamic value) => value == null));
    }

    return encodeJson(
      applyHeader(
        request,
        contentTypeKey,
        jsonHeaders,
        override: false,
      ),
    );
  }

  @override
  FutureOr<Response<BodyType>> convertResponse<BodyType, InnerType>(
      Response<dynamic> response) async {
    return (await decodeJson<BodyType, InnerType>(response))
        as Response<BodyType>;
  }

  @override
  FutureOr<Response<dynamic>> convertError<BodyType, InnerType>(
      Response<dynamic> response) async {
    return await decodeJson<BodyType, InnerType>(response);
  }

  @override
  FutureOr<Response<dynamic>> decodeJson<BodyType, InnerType>(
      Response<dynamic> response) async {
    final List<String> supportedContentTypes = [jsonHeaders, jsonApiHeaders];

    final String? contentType = response.headers[contentTypeKey];
    var body = response.body;

    if (supportedContentTypes.contains(contentType)) {
      // If we're decoding JSON, there's some ambiguity in https://tools.ietf.org/html/rfc2616
      // about what encoding should be used if the content-type doesn't contain a 'charset'
      // parameter. See https://github.com/dart-lang/http/issues/186. In a nutshell, without
      // an explicit charset, the Dart http library will fall back to using ISO-8859-1, however,
      // https://tools.ietf.org/html/rfc8259 says that JSON must be encoded using UTF-8. So,
      // we're going to explicitly decode using UTF-8... if we don't do this, then we can easily
      // end up with our JSON string containing incorrectly decoded characters.
      body = utf8.decode(response.bodyBytes);
    }

    body = await tryDecodeJson(body);
    if (isTypeOf<BodyType, ApiResponse<List<dynamic>>>()) {
      body = ApiResponse<List<InnerType>>.fromJson(body);
    } else if (isTypeOf<BodyType, ApiResponse<dynamic>>()) {
      if (InnerType != BodyType) {
        body = ApiResponse<InnerType>.fromJson(body);
      } else {
        body = ApiResponse<dynamic>.fromJson(body);
      }
    }
    // else if (isTypeOf<BodyType, ApiResponseWithListBean<dynamic>>()) {
    //   body = ApiResponseWithListBean<InnerType>.fromJson(body);
    // }
    else {
      body = jsonToObject<BodyType>(body);
    }

    return response.copyWith<BodyType>(body: body);
  }
}
