import 'package:eduasistogrenci/models/Derslik.dart';
import 'package:eduasistogrenci/models/Kurumlar.dart';
import 'package:eduasistogrenci/models/Sezon.dart';

class User {
  String oturumToken;
  String adSoyad;
  int kullaniciID;
  List<Sezon> sezonlar;
  List<Derslik> derslikler;
  List<Kurumlar> kurumlar;
  bool isError = false;
  String errorMessage;

  User({
    this.oturumToken,
    this.adSoyad,
    this.kullaniciID,
    this.sezonlar,
    this.derslikler,
    this.kurumlar,
    this.isError,
    this.errorMessage,
  });

  factory User.fromJson(Map jdata) {
    return User(
        isError: jdata["isError"] == true, //  yeni ekledim SM
        errorMessage: jdata["ErrorMessage"], //  yeni ekledim SM
        oturumToken: jdata["OturumToken"],
        adSoyad: jdata["AdSoyad"],
        kullaniciID: jdata["KullaniciID"],
        sezonlar: jdata['Sezonlar'] == null
            ? []
            : List<Map>.from(jdata['Sezonlar'])
                .map((e) => Sezon.fromJson(e))
                .toList(),
        derslikler: jdata['Derslikler'] == null
            ? []
            : List<Map>.from(jdata['Derslikler'])
                .map((e) => Derslik.fromJson(e))
                .toList(),
        kurumlar: jdata['Kurumlar'] == null
            ? []
            : List<Map>.from(jdata['Kurumlar'])
                .map((e) => Kurumlar.fromJson(e))
                .toList());
  }
}
