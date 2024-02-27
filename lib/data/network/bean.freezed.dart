// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bean.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NetworkConfig _$NetworkConfigFromJson(Map<String, dynamic> json) {
  return _NetworkConfig.fromJson(json);
}

/// @nodoc
mixin _$NetworkConfig {
  @JsonKey(name: 'baseUrl')
  String get baseUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'httpProxy')
  String get httpProxy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetworkConfigCopyWith<NetworkConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkConfigCopyWith<$Res> {
  factory $NetworkConfigCopyWith(
          NetworkConfig value, $Res Function(NetworkConfig) then) =
      _$NetworkConfigCopyWithImpl<$Res, NetworkConfig>;
  @useResult
  $Res call(
      {@JsonKey(name: 'baseUrl') String baseUrl,
      @JsonKey(name: 'httpProxy') String httpProxy});
}

/// @nodoc
class _$NetworkConfigCopyWithImpl<$Res, $Val extends NetworkConfig>
    implements $NetworkConfigCopyWith<$Res> {
  _$NetworkConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseUrl = null,
    Object? httpProxy = null,
  }) {
    return _then(_value.copyWith(
      baseUrl: null == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      httpProxy: null == httpProxy
          ? _value.httpProxy
          : httpProxy // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NetworkConfigImplCopyWith<$Res>
    implements $NetworkConfigCopyWith<$Res> {
  factory _$$NetworkConfigImplCopyWith(
          _$NetworkConfigImpl value, $Res Function(_$NetworkConfigImpl) then) =
      __$$NetworkConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'baseUrl') String baseUrl,
      @JsonKey(name: 'httpProxy') String httpProxy});
}

/// @nodoc
class __$$NetworkConfigImplCopyWithImpl<$Res>
    extends _$NetworkConfigCopyWithImpl<$Res, _$NetworkConfigImpl>
    implements _$$NetworkConfigImplCopyWith<$Res> {
  __$$NetworkConfigImplCopyWithImpl(
      _$NetworkConfigImpl _value, $Res Function(_$NetworkConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseUrl = null,
    Object? httpProxy = null,
  }) {
    return _then(_$NetworkConfigImpl(
      baseUrl: null == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      httpProxy: null == httpProxy
          ? _value.httpProxy
          : httpProxy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NetworkConfigImpl implements _NetworkConfig {
  const _$NetworkConfigImpl(
      {@JsonKey(name: 'baseUrl') this.baseUrl = "",
      @JsonKey(name: 'httpProxy') this.httpProxy = ""});

  factory _$NetworkConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$NetworkConfigImplFromJson(json);

  @override
  @JsonKey(name: 'baseUrl')
  final String baseUrl;
  @override
  @JsonKey(name: 'httpProxy')
  final String httpProxy;

  @override
  String toString() {
    return 'NetworkConfig(baseUrl: $baseUrl, httpProxy: $httpProxy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkConfigImpl &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl) &&
            (identical(other.httpProxy, httpProxy) ||
                other.httpProxy == httpProxy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, baseUrl, httpProxy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkConfigImplCopyWith<_$NetworkConfigImpl> get copyWith =>
      __$$NetworkConfigImplCopyWithImpl<_$NetworkConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NetworkConfigImplToJson(
      this,
    );
  }
}

abstract class _NetworkConfig implements NetworkConfig {
  const factory _NetworkConfig(
          {@JsonKey(name: 'baseUrl') final String baseUrl,
          @JsonKey(name: 'httpProxy') final String httpProxy}) =
      _$NetworkConfigImpl;

  factory _NetworkConfig.fromJson(Map<String, dynamic> json) =
      _$NetworkConfigImpl.fromJson;

  @override
  @JsonKey(name: 'baseUrl')
  String get baseUrl;
  @override
  @JsonKey(name: 'httpProxy')
  String get httpProxy;
  @override
  @JsonKey(ignore: true)
  _$$NetworkConfigImplCopyWith<_$NetworkConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
