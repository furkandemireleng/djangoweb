import 'package:eduasistogrenci/models/Ders.dart';
import 'package:eduasistogrenci/models/Gun.dart';

class DersProgrami {
  String programAdi;
  int dersSayisi;
  int dersSuresi;
  int teneffusSr;
  String baslamaSaatiStr;
  String baslamaSaati;
  List<Gun> gunler;
  List<Ders> dersler;

  DersProgrami({
    this.programAdi,
    this.dersSayisi,
    this.dersSuresi,
    this.teneffusSr,
    this.baslamaSaatiStr,
    this.baslamaSaati,
    this.gunler,
    this.dersler,
  });

  factory DersProgrami.fromJson(Map json) {
    print(json);
    return DersProgrami(
      programAdi:
          json['ProgramAdi'] != null ? json['ProgramAdi'].toString() : '',
      dersSayisi: json['DersSayisi'] != null ? json['DersSayisi'] : '',
      dersSuresi: json['DersSuresi'] != null ? json['DersSuresi'] : '',
      teneffusSr: json['TeneffusSr'] != null ? json['TeneffusSr'] : '',
      baslamaSaatiStr:
          json['BaslamaSaatiStr'] != null ? json['BaslamaSaatiStr'] : '',
      baslamaSaati: json['BaslamaSaati'] != null ? json['BaslamaSaati'] : '',
      gunler: json['Gunler'] != null
          ? List<Map>.from(json['Gunler']).map((e) => Gun.fromJson(e)).toList()
          : [],
      dersler: json['Dersler'] != null
          ? List<Map>.from(json['Dersler'])
              .map((e) => Ders.fromJson(e))
              .toList()
          : [],
    );
  }
}
