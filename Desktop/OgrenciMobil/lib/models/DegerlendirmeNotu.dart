class DegerlendirmeNotu {
  bool durum;
  String mesaj;
  int sonucID;
  DegerlendirmeNotu({
    this.durum,
    this.mesaj,
    this.sonucID,
  });

  factory DegerlendirmeNotu.fromJson(Map json) => DegerlendirmeNotu(
        durum: json['Durum'] != null ? json['Durum'] : false,
        mesaj: json['Mesaj'] != null ? json['Mesaj'] : '',
        sonucID: json['SonucID'] != null ? json['SonucID'] : 0,
      );
}
