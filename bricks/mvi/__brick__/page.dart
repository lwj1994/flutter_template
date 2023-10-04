/// @author luwenjie on 2023/10/4 21:23:03

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wen_foundation/foundation.dart';
import 'model.dart';
import 'view_model.dart';

/// @author luwenjie on 2023/9/29 14:47:38
@RoutePage()
class {{pageName.pascalCase()}}Page extends BasePage {
  const {{pageName.pascalCase()}}Page({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _{{pageName.pascalCase()}}Page();
}

class _{{pageName.pascalCase()}}Page extends BasePageState<{{pageName.pascalCase()}}Page> {
  late final _provider = {{pageName.camelCase()}}Provider;

  {{pageName.pascalCase()}}State get _state => ref.read(_provider);

  {{pageName.pascalCase()}}ViewModel get _viewModel => ref.read(_provider.notifier);

  @override
  Widget build(BuildContext context) {
    ref.watch(_provider);
    return Scaffold(
      appBar: AppBar(
        title: Text("{{pageName.pascalCase()}}"),
      ),
    );
  }
}
