class Derslik {
  int derslikID;
  String derslikAd;
  String sinifID;
  String sinifAd;

  Derslik({
    this.derslikID,
    this.derslikAd,
    this.sinifID,
    this.sinifAd,
  });
  factory Derslik.fromJson(Map jdata){
    return Derslik(
      derslikID: jdata['DerslikID'],
      derslikAd: jdata['DerslikAd'].toString(),
      sinifID: jdata['SinifID'].toString(),
      sinifAd: jdata['SinifAd'].toString(),
    );
  }
}