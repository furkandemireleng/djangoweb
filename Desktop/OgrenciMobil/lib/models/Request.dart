class RequestData {
  int id;
  String oturumToken;
  String appToken;
  String kullanici;
  String parola;
  String notificationkey;

  String ogrenciID;
  String sezonID;
  String derslikID;

  int cedayID;
  String katilimLogParametresi;

  int takipTanimID;
  int ogretmenID;
  String gunDDMMYYYY;

  RequestData({
    this.id,
    this.oturumToken,
    this.appToken,
    this.kullanici,
    this.parola,
    this.notificationkey,
    this.ogrenciID,
    this.sezonID,
    this.derslikID,
    this.takipTanimID,
    this.ogretmenID,
    this.gunDDMMYYYY,
    this.cedayID,
    this.katilimLogParametresi,
  });

  Map<String, dynamic> toMap() => {
        'ID': this.id,
        'OturumToken': this.oturumToken,
        'appToken': this.appToken,
        'kullanici': this.kullanici,
        'parola': this.parola,
        'notificationkey': this.notificationkey,
        'OgrenciID': this.ogrenciID,
        'SezonID': this.sezonID,
        'DerslikID': this.derslikID,
        'TakipTanimID': this.takipTanimID,
        'OgretmenID': this.ogretmenID,
        'GunDDMMYYYY': this.gunDDMMYYYY,
        'CedayID': this.cedayID,
        'KatilimLogParametresi': this.katilimLogParametresi,
      };
}
