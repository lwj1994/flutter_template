import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const ProviderScope riverpodScope = ProviderScope(
    child: Application(),
  );
  runApp(riverpodScope);
}
