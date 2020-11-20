class Rozet {
  String tarihGunDate;
  String tarihGunStr;
  String bransAd;
  String ogretmen;
  String rozetAd;
  String ikonUrl;
  int puan;
  String aciklama;

  Rozet({
    this.tarihGunDate,
    this.tarihGunStr,
    this.bransAd,
    this.ogretmen,
    this.rozetAd,
    this.ikonUrl,
    this.puan,
    this.aciklama
  });
  
  factory Rozet.fromJson(Map json) => Rozet(
    tarihGunDate: json['TarihGunDate'] != null ? json['TarihGunDate'] : '',
    tarihGunStr: json['TarihGunStr'] != null ? json['TarihGunStr'] : '',
    bransAd: json['BransAd'] != null ? json['BransAd'] : '',
    ogretmen: json['Ogretmen'] != null ? json['Ogretmen'] : '',
    rozetAd: json['RozetAd'] != null ? json['RozetAd'] : '',
    ikonUrl: json['ikonUrl'] != null ? json['ikonUrl'] : '',
    puan: json['Puan'] != null ? json['Puan'] : '',
    aciklama: json['Aciklama'] != null ? json['Aciklama'] : '',
  );
}