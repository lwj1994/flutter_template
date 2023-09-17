import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wen_foundation/foundation.dart';
import 'model.dart';
import 'view_model.dart';
import 'package:auto_route/auto_route.dart';

/// @author luwenjie on 2023/9/13 23:32:07
@RoutePage()
class MainPage extends BasePage {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPage();
}

class _MainPage extends BasePageState<MainPage> {
  late final _provider = mainProvider;

  MainState get _state => ref.read(_provider);

  MainViewModel get _viewModel => ref.read(_provider.notifier);

  @override
  Widget build(BuildContext context) {
    ref.watch(_provider);
    return Scaffold(
      body: Text("MainPage"),
    );
  }
}
