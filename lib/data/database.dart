/// @author luwenjie on 2023/9/14 22:43:45

import 'package:isar/isar.dart';
import 'package:wen_foundation/foundation.dart';

import 'db_bean.dart';

/// @author luwenjie on 2023/4/7 15:37:43

final appDb = _DataBase();

class _DataBase {
  late final Isar _isar;
  late final IsarCollection<KeyValueDbBean> _kv = _isar.keyValueDbBeans;

  Isar get isar => _isar;

  Future<void> init() async {
    _isar = await Isar.open([
      KeyValueDbBeanSchema,
    ],
        inspector: appEnv.isDebug,
        directory: (await FileUtil.getDbDirectory()).path);
  }

  Future<Id> putKeyValueDbBean(KeyValueDbBean keyValueDbBean) async {
    return await _isar.writeTxn(() => _kv.put(keyValueDbBean));
  }

  Future<bool> deleteKeyValueDbBean(String key) async {
    return await _isar.writeTxn(() => _kv.deleteByKey(key));
  }

  String getKeyValueDbBean(String key) {
    return (_kv.getByKeySync(key))?.value ?? "";
  }

  void logClear() {
    _isar.writeTxn(() => _kv.clear());
  }
}
