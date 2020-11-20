import 'package:eduasistogrenci/models/Mesaj.dart';

class GununCedaylariModel {
  bool durum;
  List<Mesaj> mesaj;
  int sonucId;

  GununCedaylariModel({
    this.durum,
    this.mesaj,
    this.sonucId,
  });

  factory GununCedaylariModel.fromJson(Map<String, dynamic> json) {
    var list = json['Mesaj'] as List;
    print(list.runtimeType);
    List<Mesaj> mesajList = list.map((i) => Mesaj.fromJson(i)).toList();

    return GununCedaylariModel(
      durum: json['Durum'] != null ? json['Durum'] : false,
      mesaj: mesajList,
      sonucId: json['SonucID'] != null ? json['SonucID'] : 0,
    );
  }
}
