// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<T> _$ApiResponseFromJson<T>(Map<String, dynamic> json) =>
    ApiResponse<T>(
      code: json['code'] ?? ApiService.codeNone,
      msg: json['msg'] ?? "",
      data: jsonToObject(json['data']),
      list: jsonToList(json['rows']),
      total: json['total'] as int? ?? 0,
    );

_$NetworkConfigImpl _$$NetworkConfigImplFromJson(Map<String, dynamic> json) =>
    _$NetworkConfigImpl(
      baseUrl: json['baseUrl'] as String? ?? "",
      httpProxy: json['httpProxy'] as String? ?? "",
    );

Map<String, dynamic> _$$NetworkConfigImplToJson(_$NetworkConfigImpl instance) =>
    <String, dynamic>{
      'baseUrl': instance.baseUrl,
      'httpProxy': instance.httpProxy,
    };
