import 'package:eduasistogrenci/pages/dokuman_analizi_detay_page.dart';
import 'package:flutter/material.dart';

class DokumanAnaliziPage extends StatefulWidget {
  @override
  _DokumanAnaliziPageState createState() => _DokumanAnaliziPageState();
}

class _DokumanAnaliziPageState extends State<DokumanAnaliziPage> {
  List<List<String>> _rows = [
    ["Türkçe Test", "Türkçe", "%30"],
    ["Matematik Test", "Matematik", "%40"],
    ["Matematik Test 2", "Matematik", "%50"],
    ["Türkçe Test", "Türkçe", "%30"],
    ["Kimya Test", "Kimya", "%70"],
    ["Türkçe Test", "Türkçe", "%30"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Döküman Analizi"),
      ),
      body: ListView(
        children: [
          DataTable(
            columns: [
              DataColumn(label: Text("Kitap")),
              DataColumn(label: Text("Branş")),
              DataColumn(label: Text("Bitti %")),
            ],
            rows: _rows
                .map(
                  (cells) => DataRow(
                    cells: cells
                        .map(
                          (cell) => DataCell(Text(cell), onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DokumanAnaliziDetayPage(title: "Döküman",),
                              ),
                            );
                          }),
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
