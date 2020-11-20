class Degerlendirme {
  int id;
  String tarihGunDate;
  String tarihGunStr;
  String baslik;
  String bransAd;
  int degerlendirmeNotTipID;
  String ogretmen;

  Degerlendirme({
    this.id,
    this.tarihGunDate,
    this.tarihGunStr,
    this.baslik,
    this.bransAd,
    this.degerlendirmeNotTipID,
    this.ogretmen,
  });

  factory Degerlendirme.fromJson(Map json) => Degerlendirme(
    id: json['ID'] != null ? json['ID'] : 0,
    tarihGunDate: json['TarihGunDate'] != null ? json['TarihGunDate'] : '',
    tarihGunStr: json['TarihGunStr'] != null ? json['TarihGunStr'] : '',
    baslik: json['Baslik'] != null ? json['Baslik'] : '',
    bransAd: json['BransAd'] != null ? json['BransAd'] : '',
    degerlendirmeNotTipID: json['DegerlendirmeNotTipID'] != null ? json['DegerlendirmeNotTipID'] : '',
    ogretmen: json['Ogretmen'] != null ? json['Ogretmen'] : '',
  );
}