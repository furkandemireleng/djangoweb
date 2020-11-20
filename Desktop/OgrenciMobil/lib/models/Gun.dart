class Gun {
  int id;
  String ad;
  String tip;

  Gun({this.id, this.ad, this.tip});

  factory Gun.fromJson(Map json) => Gun(
        id: json['ID'] != null ? json['ID'] : '',
        ad: json['Ad'] != null ? json['Ad'] : '',
        tip: json['Tip'] != null ? json['Tip'] : '',
      );
}
