import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper{
  static const String tokenKey = 'token_key';
  static Future saveToken(String token)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(tokenKey);
    return token;
  }
}