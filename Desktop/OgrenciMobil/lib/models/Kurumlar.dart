class Kurumlar {
  String kampusAd;
  String okulAd;
  String siketAd;

  Kurumlar({
    this.kampusAd,
    this.okulAd,
    this.siketAd,
  });
  factory Kurumlar.fromJson(Map jdata) {
    return Kurumlar(
      kampusAd: jdata['KampusAd'].toString(),
      okulAd: jdata['OkulAd'].toString(),
      siketAd: jdata['SirketAd'].toString(),
    );
  }
}
