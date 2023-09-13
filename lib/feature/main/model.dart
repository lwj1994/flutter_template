import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';

/// @author luwenjie on 2023/9/13 23:32:07

@freezed
class MainState with _$MainState {
  factory MainState({
    @Default(-1) int state1,
  }) = _MainState;
}