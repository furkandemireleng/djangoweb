class GunlukCeday {
  bool durum;
  Map mesaj;
  int sonucID;
  GunlukCeday({
    this.durum,
    this.mesaj,
    this.sonucID,
  });
  factory GunlukCeday.fromJson(Map json) => GunlukCeday(
        durum: json['Durum'] != null ? json['Durum'] : false,
        mesaj: json['Mesaj'] != null ? json['Mesaj'] : {},
        sonucID: json['SonucID'] != null ? json['SonucID'] : 0,
      );
}
