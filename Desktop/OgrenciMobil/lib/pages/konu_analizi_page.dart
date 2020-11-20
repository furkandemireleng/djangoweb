import 'package:flutter/material.dart';

class KonuAnaliziPage extends StatefulWidget {
  @override
  _KonuAnaliziPageState createState() => _KonuAnaliziPageState();
}

class _KonuAnaliziPageState extends State<KonuAnaliziPage> {
  List<List<String>> _rows = [
    ["Din Kültürü", "Allah İnancı", "10-3-2", "%80"],
    ["Matematik", "Denklemler", "45-5-0", "%90"],
    ["Din Kültürü", "Peygamberler Tarihi", "15-5-2", "%85"],
    ["Matematik", "Oran Orantı", "30-5-1", "%85"],
    ["Din Kültürü", "Allah İnancı", "10-3-2", "%80"],
    ["Matematik", "Denklemler", "45-5-0", "%90"],
    ["Din Kültürü", "Peygamberler Tarihi", "15-5-2", "%85"],
    ["Matematik", "Oran Orantı", "30-5-1", "%85"],
    ["Din Kültürü", "Allah İnancı", "10-3-2", "%80"],
    ["Matematik", "Denklemler", "45-5-0", "%90"],
    ["Din Kültürü", "Peygamberler Tarihi", "15-5-2", "%85"],
    ["Matematik", "Oran Orantı", "30-5-1", "%85"],
    ["Din Kültürü", "Allah İnancı", "10-3-2", "%80"],
    ["Matematik", "Denklemler", "45-5-0", "%90"],
    ["Din Kültürü", "Peygamberler Tarihi", "15-5-2", "%85"],
    ["Matematik", "Oran Orantı", "30-5-1", "%85"],
    ["Din Kültürü", "Allah İnancı", "10-3-2", "%80"],
    ["Matematik", "Denklemler", "45-5-0", "%90"],
    ["Din Kültürü", "Peygamberler Tarihi", "15-5-2", "%85"],
    ["Matematik", "Oran Orantı", "30-5-1", "%85"],
    ["Din Kültürü", "Allah İnancı", "10-3-2", "%80"],
    ["Matematik", "Denklemler", "45-5-0", "%90"],
    ["Din Kültürü", "Peygamberler Tarihi", "15-5-2", "%85"],
    ["Matematik", "Oran Orantı", "30-5-1", "%85"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Konu Analizi"),
      ),
      body: ListView(
        children: [
          DataTable(
            columnSpacing: 30,
            columns: [
              DataColumn(label: Text("Branş")),
              DataColumn(label: Text("Konu")),
              DataColumn(
                  label: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Doğru"),
                  Text("Yanlış"),
                  Text("Boş"),
                ],
              )),
              DataColumn(
                  label: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Başarı"),
                  Text("Yüzdesi"),
                ],
              )),
            ],
            rows: _rows
                .map(
                  (cells) => DataRow(
                    cells: cells
                        .map(
                          (cell) => DataCell(Text(cell)),
                        )
                        .toList(),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
