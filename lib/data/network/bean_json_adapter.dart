/// @author luwenjie on 2023/6/16 11:53:41

/// json -> object
T? jsonToObject<T>(Object? json) {
  if (json == null) return null;
  if (json is Map<String, dynamic>) {
    // if (WithdrawLog == T) {
    //   return WithdrawLog.fromJson(json) as T;
    // }
    // listBean
    // else if (T == (ListBean<WithdrawLog>)) {
    //   return ListBean<WithdrawLog>.fromJson(json) as T;
    // }
  } else if (json is List) {
    return jsonToList(json);
  }
  return json as dynamic;
}

T? jsonToList<T>(Object? json) {
  if (json == null) return null;
  if (json is List) {
    // if (T == (List<WithdrawLog>)) {
    //   return json
    //       .map((e) => WithdrawLog.fromJson(e as Map<String, dynamic>))
    //       .toList() as T;
    // }
  }

  return json as dynamic;
}
