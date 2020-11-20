import 'package:eduasistogrenci/pages/optik_form_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OdevListesiPage extends StatefulWidget {
  OdevListesiPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _OdevListesiPageState createState() => _OdevListesiPageState();
}

class _OdevListesiPageState extends State<OdevListesiPage> {
  List<String> _branslar = [
    "Matematik",
    "Türkçe",
    "Kimya",
    "Fizik",
    "Dil Bilgisi",
    "İngilizce"
  ];
  String _selectedBrans;

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      locale: Locale("tr"),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      helpText: "Ödev Tarihini Seçiniz",
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  List<Map<String, dynamic>> _rows = [
    {
      "title": "Matematik Ödevi Denklemler",
      "status": true,
    },
    {
      "title": "Matematik Ödevi Oran-Orantı",
      "status": false,
    },
    {
      "title": "Türkçe Ödevi Dil Bilgisi",
      "status": true,
    },
    {
      "title": "Fizik Ödevi Atom",
      "status": false,
    },
  ];

  void _optikFormuAc(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => OptikFormPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Ders: "),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedBrans != null
                              ? _selectedBrans
                              : _branslar[0],
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
                ),
              ),
              DataTable(
                columns: [
                  DataColumn(label: Text("Ödev")),
                  DataColumn(label: Text("Durum")),
                ],
                rows: _rows
                    .map(
                      (row) => DataRow(
                        cells: [
                          DataCell(
                            Text(row['title']),
                            onTap: () => _optikFormuAc(context),
                          ),
                          DataCell(
                            row['status']
                                ? Icon(
                                    Icons.check_circle_outline,
                                    color: Colors.primaries[4],
                                  )
                                : Icon(Icons.remove_circle_outline),
                            onTap: () => _optikFormuAc(context),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              )
            ],
          )),
    );
  }
}
