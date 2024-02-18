/// @author luwenjie on 2023/9/14 22:43:45

import 'package:isar/isar.dart';
import 'package:lu_foundation/foundation.dart';

import 'db_bean.dart';

/// @author luwenjie on 2023/4/7 15:37:43

class DbManager {
  Isar? _isar;

  IsarCollection<KeyValueDbBean> get _kv => _isar!.keyValueDbBeans;

  static DbManager? _instance;

  static DbManager get instance => _checkInstance();

  DbManager._();

  static DbManager _checkInstance() {
    _instance ??= DbManager._();
    return _instance!;
  }

  Isar get isar => _isar!;

  Future<void> initialize() async {
    _isar = await Isar.open([
      KeyValueDbBeanSchema,
    ],
        inspector: LuAppEnv.isDebug,
        directory: (await LuFileUtil.getDbDirectory()).path);
  }

  Future<Id> putKeyValueDbBean(KeyValueDbBean keyValueDbBean) async {
    return await isar.writeTxn(() => _kv.put(keyValueDbBean));
  }

  Future<bool> deleteKeyValueDbBean(String key) async {
    return await isar.writeTxn(() => _kv.deleteByKey(key));
  }

  String getKeyValueDbBean(String key) {
    return (_kv.getByKeySync(key))?.value ?? "";
  }

  void clearKv() {
    isar.writeTxn(() => _kv.clear());
  }
}
