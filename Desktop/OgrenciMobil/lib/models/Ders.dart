class Ders {
  int gun;
  String derslikID;
  String dersNo;
  String dersProgramID;
  String bransID;
  String bransAd;
  String derslikAd;
  String ogretmenAd;
  String sinifAd;
  String baslamaSaati;

  Ders({
    this.gun,
    this.derslikID,
    this.dersNo,
    this.dersProgramID,
    this.bransID,
    this.bransAd,
    this.derslikAd,
    this.baslamaSaati,
    this.ogretmenAd,
    this.sinifAd,
  });

  factory Ders.fromJson(Map json) => Ders(
        gun: json['Gun'],
        derslikAd: json['DerslikAd'].toString(),
        derslikID: json['DerslikID'].toString(),
        dersNo: json['DersNo'].toString(),
        dersProgramID: json['DersProgramID'].toString(),
        baslamaSaati: json['BaslamaSaati'].toString(),
        bransAd: json['BransAd'].toString(),
        bransID: json['BransID'].toString(),
        ogretmenAd: json['OgretmenAd'].toString(),
        sinifAd: json['SinifAd'].toString(),
      );
}
