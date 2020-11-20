import 'dart:convert';
import 'package:eduasistogrenci/models/Request.dart';
import 'package:eduasistogrenci/models/User.dart';
import 'package:eduasistogrenci/services/api_base_service.dart';
import 'package:eduasistogrenci/services/contans.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ApiBaseService {
  Future<User> login(String username, String pass,
      [String notificationkey]) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return this
        .apiRequest(
      "Oturum/OgrenciGir",
      RequestData(
        kullanici: username,
        parola: pass,
        notificationkey: notificationkey,
      ),
    )
        .then((value) {
      User user = User.fromJson(json.decode(value));
      if (user.isError == false) {
        authUser = user;
        prefs.setString('auth_user_values', value);
      }
      print("AUTH TOKEN: " +
          (user.oturumToken != null ? user.oturumToken : 'YOK'));
      return user;
    });
  }

  Future<User> authCheck() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userdatastr = prefs.getString('auth_user_values');
    if (userdatastr != null) {
      User user = User.fromJson(json.decode(userdatastr));
      authUser = user;
      return user;
    } else {
      return new User();
    }
  }

  Future<bool> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedSezon = null;
    selectedDerslik = null;
    return prefs.clear();
  }

  //.
  Future<int> getSavedSezon() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("sezonId") != null ? prefs.getInt("sezonId") : -1;
  }

  Future<void> setSavedSezon(int sezonId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("sezonId", sezonId);
  }

  //.
  Future<int> getSavedDerslik() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("derslikId") != null ? prefs.getInt("derslikId") : -1;
  }

  Future<void> setSavedDerslik(int derslikId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("derslikId", derslikId);
  }
}
