import 'package:isar/isar.dart';

/// @author luwenjie on 2023/4/7 00:56:27
///

part 'db_bean.g.dart';

@collection
class KeyValueDbBean {
  // 你也可以用 id = null 来表示 id 是自增的
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String key = "";

  String value = "";

  KeyValueDbBean({required this.key});
}
