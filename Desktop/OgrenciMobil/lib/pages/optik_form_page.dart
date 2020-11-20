import 'package:eduasistogrenci/services/contans.dart';
import 'package:flutter/material.dart';

class OptikFormPage extends StatefulWidget {
  @override
  _OptikFormPageState createState() => _OptikFormPageState();
}

class _OptikFormPageState extends State<OptikFormPage> {
  List<String> _yayinEvleri = [
    "ABC YAYINEVİ",
    "Türkçe",
    "Kimya",
    "Fizik",
    "Dil Bilgisi",
    "İngilizce"
  ];
  String _selectedYayinEvi;

  List<String> _kitaplar = [
    "AdanZye Matematik",
    "Türkçe",
    "Kimya",
    "Fizik",
    "Dil Bilgisi",
    "İngilizce"
  ];
  String _selectedKitap;

  List<String> _testler = [
    "Matematik 101",
    "Türkçe",
    "Kimya",
    "Fizik",
    "Dil Bilgisi",
    "İngilizce"
  ];
  String _selectedTest;

  Widget _renderHead() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Matematik",
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      "Deneme 1",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(5),
                child: RaisedButton(
                  color: colorPrimary,
                  onPressed: () {},
                  child: Text(
                    "Testi Kaydet",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(),
        Container(
          margin: EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 55,
                  margin: EdgeInsets.only(right: 5),
                  child: DropdownButton<String>(
                    value: _selectedYayinEvi != null
                        ? _selectedYayinEvi
                        : _yayinEvleri[0],
                    isExpanded: true,
                    items: _yayinEvleri
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (String value) {
                      setState(() => _selectedYayinEvi = value);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 55,
                  margin: EdgeInsets.only(right: 5),
                  child: DropdownButton<String>(
                    value:
                        _selectedKitap != null ? _selectedKitap : _kitaplar[0],
                    isExpanded: true,
                    items: _kitaplar
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (String value) {
                      setState(() => _selectedKitap = value);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 55,
                  margin: EdgeInsets.only(right: 5),
                  child: DropdownButton<String>(
                    value: _selectedTest != null ? _selectedTest : _testler[0],
                    isExpanded: true,
                    items: _testler
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (String value) {
                      setState(() => _selectedTest = value);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Testin Optik Formu",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Divider(),
      ],
    );
  }

  List<Map> _rows = [
    {"number": "1.", "select": "D"},
    {"number": "2.", "select": "C"},
    {"number": "3.", "select": ""},
    {"number": "4.", "select": ""},
    {"number": "5.", "select": "A"},
    {"number": "6.", "select": "C"},
    {"number": "7.", "select": "B"},
    {"number": "8.", "select": "D"},
    {"number": "9.", "select": "E"},
    {"number": "10.", "select": "A"},
    {"number": "11.", "select": "B"},
    {"number": "12.", "select": "E"},
    {"number": "13.", "select": "C"},
    {"number": "14.", "select": "C"},
    {"number": "15.", "select": "A"},
    {"number": "16.", "select": "B"},
    {"number": "17.", "select": "D"},
    {"number": "18.", "select": "D"},
    {"number": "19.", "select": "E"},
    {"number": "20.", "select": "A"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Optik Form"),
      ),
      body: Column(
        children: [
          _renderHead(),
          Flexible(
            child: ListView(
              children: [
                DataTable(
                    headingRowHeight: 2,
                    columnSpacing: 20,
                    columns: [
                      DataColumn(label: Text("")),
                      DataColumn(label: Text("")),
                      DataColumn(label: Text("")),
                      DataColumn(label: Text("")),
                      DataColumn(label: Text("")),
                      DataColumn(label: Text("")),
                    ],
                    rows: _rows
                        .map((r) => DataRow(cells: [
                              DataCell(Text(r['number'])),
                              DataCell(
                                Row(
                                  children: [
                                    Icon(r['select'] == "A"
                                        ? Icons.check_box
                                        : Icons.check_box_outline_blank),
                                    Text("A")
                                  ],
                                ),
                                onTap: () => setState(() {
                                  if (r['select'] == 'A') {
                                    r['select'] = '';
                                  } else {
                                    r['select'] = 'A';
                                  }
                                }),
                              ),
                              DataCell(
                                Row(
                                  children: [
                                    Icon(r['select'] == "B"
                                        ? Icons.check_box
                                        : Icons.check_box_outline_blank),
                                    Text("B")
                                  ],
                                ),
                                onTap: () => setState(() {
                                  if (r['select'] == 'B') {
                                    r['select'] = '';
                                  } else {
                                    r['select'] = 'B';
                                  }
                                }),
                              ),
                              DataCell(
                                Row(
                                  children: [
                                    Icon(r['select'] == "C"
                                        ? Icons.check_box
                                        : Icons.check_box_outline_blank),
                                    Text("C")
                                  ],
                                ),
                                onTap: () => setState(() {
                                  if (r['select'] == 'C') {
                                    r['select'] = '';
                                  } else {
                                    r['select'] = 'C';
                                  }
                                }),
                              ),
                              DataCell(
                                Row(
                                  children: [
                                    Icon(r['select'] == "D"
                                        ? Icons.check_box
                                        : Icons.check_box_outline_blank),
                                    Text("D")
                                  ],
                                ),
                                onTap: () => setState(() {
                                  if (r['select'] == 'D') {
                                    r['select'] = '';
                                  } else {
                                    r['select'] = 'D';
                                  }
                                }),
                              ),
                              DataCell(
                                Row(
                                  children: [
                                    Icon(r['select'] == "E"
                                        ? Icons.check_box
                                        : Icons.check_box_outline_blank),
                                    Text("E")
                                  ],
                                ),
                                onTap: () => setState(() {
                                  if (r['select'] == 'E') {
                                    r['select'] = '';
                                  } else {
                                    r['select'] = 'E';
                                  }
                                }),
                              ),
                            ]))
                        .toList())
              ],
            ),
          )
        ],
      ),
    );
  }
}
