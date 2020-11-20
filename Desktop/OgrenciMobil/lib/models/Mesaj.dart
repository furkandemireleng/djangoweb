class Mesaj {
  int cedayId;
  String baslamaTarihi;
  String baslamaTarihiStr;
  String aciklama;
  String derslikAd;
  bool isOnlineDers;
  String konuAd;
  int sure;
  String ogretmenAd;
  String bransAd;
  String webUrl;
  String zoomUrl;
  String katilimLogParametresi;

  Mesaj({
    this.cedayId,
    this.baslamaTarihi,
    this.baslamaTarihiStr,
    this.aciklama,
    this.derslikAd,
    this.isOnlineDers,
    this.konuAd,
    this.sure,
    this.ogretmenAd,
    this.bransAd,
    this.webUrl,
    this.zoomUrl,
    this.katilimLogParametresi,
  });
  factory Mesaj.fromJson(Map<String, dynamic> json) {
    return Mesaj(
      cedayId: json['CedayID'] != null ? json['CedayID'] : 0,
      baslamaTarihi: json['BaslamaTarihi'] != null ? json['BaslamaTarihi'] : '',
      baslamaTarihiStr:
          json['BaslamaTarihiStr'] != null ? json['BaslamaTarihiStr'] : '',
      aciklama: json['Aciklama'] != null ? json['Aciklama'] : '',
      derslikAd: json['DerslikAd'] != null ? json['DerslikAd'] : '',
      isOnlineDers: json['isOnlineDers'] != null ? json['isOnlineDers'] : false,
      konuAd: json['KonuAd'] != null ? json['KonuAd'] : '',
      sure: json['Sure'] != null ? json['Sure'] : 0,
      ogretmenAd: json['OgretmenAd'] != null ? json['OgretmenAd'] : '',
      bransAd: json['BransAd'] != null ? json['BransAd'] : '',
      webUrl: json['WebUrl'] != null ? json['WebUrl'] : '',
      zoomUrl: json['ZoomUrl'] != null ? json['ZoomUrl'] : '',
      katilimLogParametresi: json['KatilimLogParametresi'] != null
          ? json['KatilimLogParametresi']
          : '',
    );
  }
}
