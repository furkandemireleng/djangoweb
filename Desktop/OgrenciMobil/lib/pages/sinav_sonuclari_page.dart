import 'package:eduasistogrenci/pages/sinav_sonuc_detay_page.dart';
import 'package:flutter/material.dart';

class SinavSonuclariPage extends StatefulWidget {
  var title;

  @override
  _SinavSonuclariPageState createState() => _SinavSonuclariPageState();
  SinavSonuclariPage({Key key, this.title}) : super(key: key);
}

class _SinavSonuclariPageState extends State<SinavSonuclariPage> {
  List<Map> _rows = [
    {
      "tarih": "13.05.2020",
      "isim": "8.Sınıf İşler",
      "tur": "Liselere Giriş Sınavı",
    },
    {
      "tarih": "03.04.2019",
      "isim": "TYT HIZ VE RENK",
      "tur": "YKS Temel Yeterlilik",
    },
  ];

  void _openDetail(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SinavSonucDetayPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          DataTable(
            horizontalMargin: 10,
            columns: [
              DataColumn(label: Text("Tanımlama")),
              DataColumn(label: Expanded(child: Text("Sınav Adı"))),
              DataColumn(label: Text("Sınav Türü")),
              DataColumn(label: Text("")),
            ],
            rows: _rows
                .map(
                  (row) => DataRow(
                    cells: [
                      DataCell(
                        Text(row['tarih']),
                        onTap: () => _openDetail(context),
                      ),
                      DataCell(
                        Text(row['isim']),
                        onTap: () => _openDetail(context),
                      ),
                      DataCell(
                        Text(row['tur']),
                        onTap: () => _openDetail(context),
                      ),
                      DataCell(
                        Icon(Icons.edit),
                        onTap: () => _openDetail(context),
                      ),
                    ],
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
