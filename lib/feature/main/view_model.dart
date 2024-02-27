import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uizakura/uizakura.dart';
import 'model.dart';

/// @author luwenjie on 2023/9/13 23:32:07

final AutoDisposeStateNotifierProvider<MainViewModel, MainState> mainProvider =
    StateNotifierProvider.autoDispose<MainViewModel, MainState>((ref) {
  return MainViewModel(MainState());
});

class MainViewModel extends UizakuraViewModel<MainState> {
  MainViewModel(super.state);
}
