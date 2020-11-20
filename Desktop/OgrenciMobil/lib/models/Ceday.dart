class Ceday {
  String KatilimLogParametresi;
  int OgrenciID;
  int SezonID;
  int DerslikID;

  Ceday({
    this.KatilimLogParametresi,
    this.OgrenciID,
    this.SezonID,
    this.DerslikID,
  });
  factory Ceday.fromJson(Map json) => Ceday(
        KatilimLogParametresi: json['KatilimLogParametresi'] != null
            ? json['KatilimLogParametresi']
            : '',
        OgrenciID: json['OgrenciID'] != null ? json['OgrenciID'] : 0,
        SezonID: json['SezonID'] != null ? json['SezonID'] : 0,
        DerslikID: json['DerslikID'] != null ? json['DerslikID'] : 0,
      );
}
