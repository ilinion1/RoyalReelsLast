import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:royal_reels/core/extensions/helper_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart' as sh;

class LocalStorage {
  static sh.SharedPreferences? store;

  static Future<void> prepare() async {
    store = await sh.SharedPreferences.getInstance().then((value) => value);
    'storeageInit'.log();
  }

  static Future<Map<String, dynamic>> readJson(String key) async {
    final data = (await rootBundle
        .loadString(key)
        .then((jsonStr) => (jsonDecode(jsonStr) as Map<String, dynamic>)));
    return data..log(message: 'gettedData from: $key\n');
  }

  static String? getStr(String key) {
    return store!.getString(key)..log(message: 'gettedData from: $key\n');
  }

  static List<String>? getListOfStr(String key) {
    return store!.getStringList(key)..log(message: 'gettedData from: $key\n');
  }

  static int? getInt(String key) {
    return store!.getInt(key)..log(message: 'gettedData from: $key\n');
  }

  static bool? getBool(String key) {
    return store!.getBool(key)..log(message: 'gettedData from: $key\n');
  }

  static double? getDouble(String key) {
    return store!.getDouble(key)..log(message: 'gettedData from: $key\n');
  }

  static Future<void> setVal<T>(T val, String key) async {
    if (T == int) {
      await store!.setInt(key, val as int);
      return;
    }
    if (T == String) {
      await store!.setString(key, val as String);
      return;
    }
    if (T == bool) {
      await store!.setBool(key, val as bool);
      return;
    }
    if (T == List<String>) {
      await store!.setStringList(key, val as List<String>);
      return;
    }
    if (T == double) {
      await store!.setDouble(key, val as double);
      return;
    }
    throw Exception(['Save Value Exeption: Type <<$T>> is not supported']);
  }
}
