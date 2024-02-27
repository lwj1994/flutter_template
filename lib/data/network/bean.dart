import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:temple/data/event.dart';
import 'package:temple/data/network/manager.dart';

import 'api.dart';
import 'bean_json_adapter.dart';

part 'bean.freezed.dart';

part 'bean.g.dart';

/// @author luwenjie on 2024/2/26 21:08:46

@JsonSerializable(createToJson: false, ignoreUnannotated: true)
class ApiResponse<T> {
  // int or string ??
  @JsonKey(name: 'code')
  final dynamic code;

  @JsonKey(name: 'msg')
  final dynamic msg;

  @JsonKey(name: 'total')
  final int total;

  @JsonKey(name: "data", fromJson: jsonToObject)
  final T? data;

  @JsonKey(name: "rows", fromJson: jsonToList)
  final List<T>? list;

  const ApiResponse({
    this.code = ApiService.codeNone,
    this.msg = "",
    this.data,
    this.list,
    this.total = 0,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}

@freezed
class NetworkConfig with _$NetworkConfig {
  const factory NetworkConfig({
    @JsonKey(name: 'baseUrl') @Default("") String baseUrl,
    @JsonKey(name: 'httpProxy') @Default("") String httpProxy,
  }) = _NetworkConfig;

  factory NetworkConfig.fromJson(Map<String, Object?> json) =>
      _$NetworkConfigFromJson(json);
}
