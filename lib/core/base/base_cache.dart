import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'base_model.dart';

// this class is not a full local storage solution it's just a wrapper around the `shared_preferences` library
// it will only save models and simple string
// I removed the list saving functionality cause using it is a crime and I will cut your balls if you tried to use it again
// I called it the Memento cause of the movie
class Memento {
  final SharedPreferences sharedPreferences;
  Memento(this.sharedPreferences);

  // this is the function that will save the string you need to provide the key as a constant from constant String file
  Future<bool> saveAString(String string, String key) async {
    return sharedPreferences.setString(key, string);
  }

  // this will retrieve the string using the key you want
  Future<String?> getAString(String key) async {
    final String? jsonString = sharedPreferences.getString(key);
    return jsonString;
  }

  // this will save an object by converting it into a json string
  Future<bool> saveAThing(model, String key) async {
    var thing = model.toJson();
    return sharedPreferences.setString(key, json.encode(thing));
  }

  // and this will get the object by converting the json string that we saved
  Future<dynamic> getAThingFromCash<T extends BaseModel>(String key,
      {required model}) {
    final String jsonString = sharedPreferences.getString(key) ?? "";

    if (jsonString != "") {
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      dynamic thing = model.fromJson(jsonMap);
      return Future.value(thing);
    } else {
      return Future.value(null);
    }
  }

  Future<bool> clear() async {
    return sharedPreferences.clear();
  }
}
