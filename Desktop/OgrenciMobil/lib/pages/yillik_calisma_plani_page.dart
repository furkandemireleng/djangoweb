import 'package:flutter/material.dart';

class YillikCalismaPlaniPage extends StatefulWidget {
  @override
  _YillikCalismaPlaniPageState createState() => _YillikCalismaPlaniPageState();
}

class _YillikCalismaPlaniPageState extends State<YillikCalismaPlaniPage> {
  List<List<String>> _rows = [
    ["1.Hafta", "08:00", "Denklemler 1"],
    ["1.Hafta", "09:00", "Denklemler 2"],
    ["1.Hafta", "10:00", "Denklemler 3"],
    ["1.Hafta", "11:00", "Denklemler 4"],
    ["2.Hafta", "10:00", "Denklemler"],
    ["3.Hafta", "10:00", "Denklemler"],
    ["4.Hafta", "10:00", "Denklemler"],
    ["5.Hafta", "10:00", "Denklemler"],
    ["6.Hafta", "10:00", "Denklemler"],
    ["7.Hafta", "10:00", "Denklemler"],
    ["8.Hafta", "10:00", "Denklemler"],
    ["9.Hafta", "10:00", "Denklemler"],
    ["10.Hafta", "10:00", "Denklemler"],
    ["11.Hafta", "10:00", "Denklemler"],
    ["12.Hafta", "10:00", "Denklemler"],
    ["13.Hafta", "10:00", "Denklemler"],
  ];

  List<String> _branslar = [
    "Matematik",
    "Türkçe",
    "Kimya",
    "Fizik",
    "Dil Bilgisi",
    "İngilizce"
  ];
  String _selectedBrans;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yıllık Çalışma Planı"),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedBrans != null ? _selectedBrans : _branslar[0],
              items: _branslar
                  .map((e) => DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      ))
                  .toList(),
              onChanged: (String value) {
                setState(() => _selectedBrans = value);
              },
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          DataTable(
            columns: [
              DataColumn(label: Text("Hafta")),
              DataColumn(label: Text("Ders Saati")),
              DataColumn(label: Text("Konu")),
            ],
            rows: _rows
                .map(
                  (cells) => DataRow(
                    cells: cells.map((cell) => DataCell(Text(cell))).toList(),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
