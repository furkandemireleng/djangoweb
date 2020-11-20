class Sezon {
  int id;
  String ad;

  Sezon({
    this.id,
    this.ad,
  });

  factory Sezon.fromJson(Map jdata){
    return Sezon(
      id: jdata["ID"],
      ad: jdata["Ad"]
    );
  }
}