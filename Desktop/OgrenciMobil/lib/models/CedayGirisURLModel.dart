import 'package:eduasistogrenci/models/Mesaj.dart';

class CedayGirisURLModel {
  bool durum;
  Mesaj mesaj;
  int sonucId;

  CedayGirisURLModel({
    this.durum,
    this.mesaj,
    this.sonucId,
  });

  factory CedayGirisURLModel.fromJson(Map<String, dynamic> json) {
    return CedayGirisURLModel(
      durum: json['Durum'] != null ? json['Durum'] : false,
      mesaj: Mesaj.fromJson(json['Mesaj']),
      sonucId: json['SonucID'] != null ? json['SonucID'] : 0,
    );
  }
}
