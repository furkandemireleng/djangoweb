class FormAlanlar {
  String deger;
  String htmlTip;
  String ad;
  FormAlanlar({this.deger, this.htmlTip, this.ad});
  factory FormAlanlar.fromJson(Map json) => FormAlanlar(
        deger: json['Deger'].toString(),
        htmlTip: json['HtmlTip'].toString(),
        ad: json['Ad'].toString(),
      );
}
