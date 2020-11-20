import 'package:eduasistogrenci/services/contans.dart';
import 'package:flutter/material.dart';

class SinavSonucDetayPage extends StatefulWidget {
  @override
  _SinavSonucDetayPageState createState() => _SinavSonucDetayPageState();
}

class _SinavSonucDetayPageState extends State<SinavSonucDetayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sınav Sonuç Detay"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hasan Hüseyin GÜNEŞ",
                          style: TextStyle(fontSize: 22),
                        ),
                        Text(
                          "Matematik Sınavı",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "585858",
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          "B",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            DataTable(
              columnSpacing: 15,
              columns: [
                DataColumn(label: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Toplam"), Text("Soru")],
                )),
                DataColumn(label: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Toplam"), Text("Doğru")],
                )),
                DataColumn(label: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Toplam"), Text("Yanlış")],
                )),
                DataColumn(label: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Toplam"), Text("Boş")],
                )),
                DataColumn(label: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Toplam"), Text("Net")],
                )),
                DataColumn(label: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Derslik"), Text("Katılım")],
                )),
                DataColumn(label: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Toplam"), Text("Katılım")],
                )),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text("89")),
                  DataCell(Text("47")),
                  DataCell(Text("32")),
                  DataCell(Text("10")),
                  DataCell(Text("36.33")),
                  DataCell(Text("13")),
                  DataCell(Text("142")),
                ]),
              ],
            ),
            Divider(),
            Text("Sorular", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black38,),),
            DataTable(
              columnSpacing: 30,
              columns: [
                DataColumn(label: Text('Branş')),
                DataColumn(label: Text('Soru')),
                DataColumn(label: Text('Konu')),
                DataColumn(label: Text('')),
                DataColumn(label: Text('')),
                DataColumn(label: Text('')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text("Türkçe")),
                  DataCell(Text("1")),
                  DataCell(Text("Dinleme/İzleme")),
                  DataCell(Text("B")),
                  DataCell(Text("B")),
                  DataCell(Icon(Icons.check)),
                ]),
                DataRow(cells: [
                  DataCell(Text("Türkçe")),
                  DataCell(Text("2")),
                  DataCell(Text("Paragraf")),
                  DataCell(Text("C")),
                  DataCell(Text("B")),
                  DataCell(Icon(Icons.close)),
                ]),
                DataRow(cells: [
                  DataCell(Text("Türkçe")),
                  DataCell(Text("3")),
                  DataCell(Text("Paragraf")),
                  DataCell(Text("B")),
                  DataCell(Text("B")),
                  DataCell(Icon(Icons.check)),
                ]),
                DataRow(cells: [
                  DataCell(Text("Matematik")),
                  DataCell(Text("4")),
                  DataCell(Text("Denklemler ve Oran Orantı")),
                  DataCell(Text("B")),
                  DataCell(Text("B")),
                  DataCell(Icon(Icons.check)),
                ]),
                DataRow(cells: [
                  DataCell(Text("Matematik")),
                  DataCell(Text("5")),
                  DataCell(Text("Denklemler ve Oran Orantı")),
                  DataCell(Text("D")),
                  DataCell(Text("D")),
                  DataCell(Icon(Icons.check)),
                ]),
                DataRow(cells: [
                  DataCell(Text("Türkçe")),
                  DataCell(Text("6")),
                  DataCell(Text("Dinleme/İzleme")),
                  DataCell(Text("B")),
                  DataCell(Text("B")),
                  DataCell(Icon(Icons.check)),
                ]),
                DataRow(cells: [
                  DataCell(Text("Türkçe")),
                  DataCell(Text("7")),
                  DataCell(Text("Paragraf")),
                  DataCell(Text("C")),
                  DataCell(Text("B")),
                  DataCell(Icon(Icons.close)),
                ]),
                DataRow(cells: [
                  DataCell(Text("Türkçe")),
                  DataCell(Text("8")),
                  DataCell(Text("Paragraf")),
                  DataCell(Text("B")),
                  DataCell(Text("B")),
                  DataCell(Icon(Icons.check)),
                ]),
                DataRow(cells: [
                  DataCell(Text("Matematik")),
                  DataCell(Text("9")),
                  DataCell(Text("Denklemler ve Oran Orantı")),
                  DataCell(Text("B")),
                  DataCell(Text("B")),
                  DataCell(Icon(Icons.check)),
                ]),
                DataRow(cells: [
                  DataCell(Text("Matematik")),
                  DataCell(Text("10")),
                  DataCell(Text("Denklemler ve Oran Orantı")),
                  DataCell(Text("D")),
                  DataCell(Text("D")),
                  DataCell(Icon(Icons.check)),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
