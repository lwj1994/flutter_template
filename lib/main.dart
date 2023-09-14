import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
export 'util/env.dart';
export 'theme/theme.dart';
export 'base/async_state/async_state.dart';
export 'base/page/base_page.dart';
export 'package:freezed_annotation/freezed_annotation.dart';
export 'dart:io';
export 'package:flutter_riverpod/flutter_riverpod.dart';
export 'package:collection/collection.dart';
export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'routes/app_router.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const riverpodScope = ProviderScope(
    child: Application(),
  );
  runApp(riverpodScope);
}
