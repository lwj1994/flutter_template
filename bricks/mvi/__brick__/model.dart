/// @author luwenjie on 2023/10/4 21:23:26
import 'package:flutter/material.dart';


import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';

/// @author luwenjie on 2023/9/29 14:47:38

@freezed
class {{pageName.pascalCase()}}State with _${{pageName.pascalCase()}}State {
  factory {{pageName.pascalCase()}}State({
    @Default(-1) int state1,
  }) = _{{pageName.pascalCase()}}State;
}
