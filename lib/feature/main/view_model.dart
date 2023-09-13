import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoubox/base/page/view_model.dart';
import 'model.dart';

/// @author luwenjie on 2023/9/13 23:32:07

final mainProvider = StateNotifierProvider.autoDispose<
    MainViewModel,
    MainState>((ref) {
  return MainViewModel(MainState());
});


class MainViewModel extends ViewModel<MainState> {
  MainViewModel(super.state);

}