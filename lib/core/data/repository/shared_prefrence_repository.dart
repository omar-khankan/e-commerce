import 'dart:convert';

import 'package:e_commerce/core/data/models/token_info.dart';
import 'package:e_commerce/core/enums/data_type.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceRepository {
  SharedPreferences pref = Get.find<SharedPreferences>();
  String PREF_TOKEN_INFO = 'token_info';
  void setTokenInfo(TokenInfo token) {
    setPrefrenc(
        type: DataType.STRING,
        key: PREF_TOKEN_INFO,
        value: jsonEncode(token.toJson()));
  }

  TokenInfo getTokenInfo() {
    return TokenInfo.fromJson(jsonDecode(getPrefrence(PREF_TOKEN_INFO)));
  }

  void setPrefrenc({
    required DataType type,
    required String key,
    required dynamic value,
  }) async {
    switch (type) {
      case DataType.INT:
        await pref.setInt(key, value);
        break;
      case DataType.STRING:
        await pref.setString(key, value);
        break;
      case DataType.BOOL:
        await pref.setBool(key, value);
        break;
      case DataType.DOUBLE:
        await pref.setDouble(key, value);
        break;
      case DataType.LISTSTRING:
        await pref.setStringList(key, value);
        break;
    }
  }

  dynamic getPrefrence(String key) {
    return pref.get(key);
  }
}
