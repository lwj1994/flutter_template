/// @author luwenjie on 2023/10/4 21:23:14

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wen_foundation/foundation.dart';
import 'model.dart';

/// @author luwenjie on 2023/9/29 14:47:38

final {{pageName.camelCase()}}Provider =
    StateNotifierProvider.autoDispose<{{pageName.pascalCase()}}ViewModel, {{pageName.pascalCase()}}State>((ref) {
  return {{pageName.pascalCase()}}ViewModel({{pageName.pascalCase()}}State());
});

class {{pageName.pascalCase()}}ViewModel extends ViewModel<{{pageName.pascalCase()}}State> {
  {{pageName.pascalCase()}}ViewModel(super.state);
}

