class Yoklama {
  String tarihGunDate;
  String tarihGunStr;
  String derslikAd;
  int dersNo;
  String bransAd;
  String yoklamaTipID;
  String ogretmen;
  int yoklamaDurumID;
  Yoklama({
    this.tarihGunDate,
    this.tarihGunStr,
    this.derslikAd,
    this.dersNo,
    this.bransAd,
    this.yoklamaTipID,
    this.ogretmen,
    this.yoklamaDurumID,
  });

  factory Yoklama.fromJson(Map json) => Yoklama(
        tarihGunDate:
            json['TarihGunDate'] != null ? json['TarihGunDate'].toString() : '',
        tarihGunStr:
            json['TarihGunStr'] != null ? json['TarihGunStr'].toString() : '',
        derslikAd:
            json['DerslikAd'] != null ? json['DerslikAd'].toString() : '',
        dersNo: json['DersNo'] != null ? json['DersNo'] : 0,
        bransAd: json['BransAd'] != null ? json['BransAd'].toString() : '',
        yoklamaTipID:
            json['YoklamaTipID'] != null ? json['YoklamaTipID'].toString() : '',
        ogretmen: json['Ogretmen'] != null ? json['Ogretmen'].toString() : '',
        yoklamaDurumID:
            json['YoklamaDurumID'] != null ? json['YoklamaDurumID'] : '',
      );
}
