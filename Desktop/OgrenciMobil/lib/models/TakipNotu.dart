class TakipNotu {
  bool durum;
  Map mesaj;
  int sonucID;
  TakipNotu({
    this.durum,
    this.mesaj,
    this.sonucID,
  });

  factory TakipNotu.fromJson(Map json) => TakipNotu(
        durum: json['Durum'] != null ? json['Durum'] : false,
        mesaj: json['Mesaj'] != null ? json['Mesaj'] : {},
        sonucID: json['SonucID'] != null ? json['SonucID'] : 0,
      );
}
