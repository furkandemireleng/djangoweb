class Takip {
  int takipTanimID;
  int ogretmenID;
  String tarihGunDate;
  String tarihGunStr;
  String gunDDMMYYYY;
  String takipTanimAd;
  String ogretmen;
  Takip({
    this.takipTanimID,
    this.ogretmenID,
    this.tarihGunDate,
    this.tarihGunStr,
    this.gunDDMMYYYY,
    this.takipTanimAd,
    this.ogretmen,
  });

  factory Takip.fromJson(Map json) => Takip(
    takipTanimID: json['TakipTanimID'] != null ? json['TakipTanimID'] : 0,
    ogretmenID: json['OgretmenID'] != null ? json['OgretmenID'] : 0,
    tarihGunDate: json['TarihGunDate'] != null ? json['TarihGunDate'] : '',
    tarihGunStr: json['TarihGunStr'] != null ? json['TarihGunStr'] : '',
    gunDDMMYYYY: json['GunDDMMYYYY'] != null ? json['GunDDMMYYYY'] : '',
    takipTanimAd: json['TakipTanimAd'] != null ? json['TakipTanimAd'] : '',
    ogretmen: json['Ogretmen'] != null ? json['Ogretmen'] : '',
  );
}