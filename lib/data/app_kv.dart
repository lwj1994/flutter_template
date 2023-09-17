import 'database.dart';
import 'db_bean.dart';

/// @author luwenjie on 2023/9/14 22:56:26

enum AppShareKeys {
  themeMode("themeMode");

  final String id;

  const AppShareKeys(this.id);
}

extension StringExtension on String {
  Future<void> saveTo(AppShareKeys key) =>
      appDb.putKeyValueDbBean(KeyValueDbBean(key: key.name)..value = this);
}

extension SpKeyExtension on AppShareKeys {
  String get string => appDb.getKeyValueDbBean(name);

  set string(String v) =>
      appDb.putKeyValueDbBean(KeyValueDbBean(key: name)..value = v);

  int get intValue => int.tryParse(appDb.getKeyValueDbBean(name)) ?? 0;

  set intValue(int v) =>
      appDb.putKeyValueDbBean(KeyValueDbBean(key: name)..value = v.toString());

  bool get boolean => appDb.getKeyValueDbBean(name) == "true";

  set boolean(bool v) =>
      appDb.putKeyValueDbBean(KeyValueDbBean(key: name)..value = v.toString());
}
