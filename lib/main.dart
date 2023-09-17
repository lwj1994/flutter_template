import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const riverpodScope = ProviderScope(
    child: Application(),
  );
  runApp(riverpodScope);
}
