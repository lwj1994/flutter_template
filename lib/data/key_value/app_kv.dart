import 'package:temple/data/database.dart';

import 'db_bean.dart';

/// @author luwenjie on 2023/9/14 22:56:26

enum AppShareKeys {
  themeMode("themeMode");

  final String id;

  const AppShareKeys(this.id);
}

extension StringExtension on String {
  Future<void> saveTo(AppShareKeys key) => DbManager.instance
      .putKeyValueDbBean(KeyValueDbBean(key: key.name)..value = this);
}

extension SpKeyExtension on AppShareKeys {
  String get string => DbManager.instance.getKeyValueDbBean(name);

  set string(String v) => DbManager.instance
      .putKeyValueDbBean(KeyValueDbBean(key: name)..value = v);

  int get intValue =>
      int.tryParse(DbManager.instance.getKeyValueDbBean(name)) ?? 0;

  set intValue(int v) => DbManager.instance
      .putKeyValueDbBean(KeyValueDbBean(key: name)..value = v.toString());

  bool get boolean => DbManager.instance.getKeyValueDbBean(name) == "true";

  set boolean(bool v) => DbManager.instance
      .putKeyValueDbBean(KeyValueDbBean(key: name)..value = v.toString());
}
