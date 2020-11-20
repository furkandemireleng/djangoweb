import 'package:flutter/material.dart';

class DokumanAnaliziDetayPage extends StatefulWidget {
  final String title;
  DokumanAnaliziDetayPage({this.title}) : super();
  @override
  _DokumanAnaliziDetayPageState createState() =>
      _DokumanAnaliziDetayPageState();
}

class _DokumanAnaliziDetayPageState extends State<DokumanAnaliziDetayPage> {
  List<List<String>> _rows = [
    ["Türkçe Test", "50-5", "%30"],
    ["Matematik Test", "49-7", "%50"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title + " Analiz Detayı"),
      ),
      body: ListView(
        children: [
          DataTable(
            columns: [
              DataColumn(label: Text("Test Adı")),
              DataColumn(label: Text("Doğru-Yanlış")),
              DataColumn(label: Text("Başarı Oranı")),
            ],
            rows: _rows
                .map(
                  (cells) => DataRow(
                    cells: cells
                        .map(
                          (cell) => DataCell(Text(cell), onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DokumanAnaliziDetayPage(),
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
