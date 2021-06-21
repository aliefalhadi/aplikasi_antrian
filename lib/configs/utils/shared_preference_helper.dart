import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper{
  SharedPreferences sharedPreferences;
  Future storeValueString(String key,String value) async {
    sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);
  }

  Future storeValueBool(String key,bool value) async {
    sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setBool(key, value);
  }
  Future checkKey(String key) async {
    sharedPreferences=await SharedPreferences.getInstance();
    if(sharedPreferences.containsKey(key)){
      return true;
    }else{
      return false;
    }
  }
  Future getValueBool(String key) async {
    sharedPreferences=await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key);
  }
  Future getValue(String key) async {
    sharedPreferences=await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }
  Future deleteValue(String key)async{
    sharedPreferences=await SharedPreferences.getInstance();
    if(sharedPreferences.containsKey(key)){
      sharedPreferences.remove(key);
      log("key deleted",name:"Shared Preference");
    }else{
      log("key not found",name:"Shared Preference");
    }
  }
}