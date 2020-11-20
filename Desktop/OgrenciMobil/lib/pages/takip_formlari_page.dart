import 'package:eduasistogrenci/models/Request.dart';
import 'package:eduasistogrenci/models/Takip.dart';
import 'package:eduasistogrenci/pages/takip_formlari_detay.dart';
import 'package:eduasistogrenci/services/api_service.dart';
import 'package:eduasistogrenci/services/contans.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TakipFormlariPage extends StatefulWidget {
  var title;

  @override
  TakipFormlariPage({Key key, this.title}) : super(key: key);

  _TakipFormlariPageState createState() => _TakipFormlariPageState();
}

class _TakipFormlariPageState extends State<TakipFormlariPage> {
  List<Takip> takipler = [];
  bool bos = false;

  @override
  void initState() {
    ApiService().getTakipFormlari(RequestData()).then((value) {
      if (value.isEmpty) {
        setState(() {
          bos = true;
        });
      } else {
        setState(() {
          takipler = value;
          bos = false;
        });
      }
    });
    super.initState();
  }

  Widget formWidget(takipler) {
    return Container(
      margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 2,
        child: ExpansionTile(
          title: Text(
            takipler.takipTanimAd,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                takipler.ogretmen,
                style: TextStyle(color: Colors.black45),
              ),
              Text(
                takipler.tarihGunStr,
                style: TextStyle(color: Colors.black45),
              ),
            ],
          ),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  left: 15.0, right: 15.0, bottom: 10.0, top: 5.0),
              child: TakipFormlariDetayPage(takipler.takipTanimID,
                  takipler.ogretmenID, takipler.gunDDMMYYYY),
            )
          ],
        ),
      ),
    );
  }

  Widget noForm() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.cancel, size: 80, color: colorPrimary),
          SizedBox(height: 10),
          Text(
            "Hiç form takibi oluşturulmamış ...",
            style: TextStyle(fontSize: 20, color: Colors.black45),
          ),
          Row(),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: takipler.length > 0
          ? SingleChildScrollView(
              child: DataTable(
                  columnSpacing: 20,
                  columns: [
                    DataColumn(label: Text("Tarih")),
                    DataColumn(label: Text("Öğretmen")),
                    DataColumn(label: Text("Takip Formu")),
                    DataColumn(label: Text("")),
                  ],
                  rows: takipler
                      .map((takip) => DataRow(cells: [
                            DataCell(Text(takip.tarihGunStr)),
                            DataCell(Text(takip.ogretmen)),
                            DataCell(Text(takip.takipTanimAd)),
                            DataCell(
                                Container(
                                  child: Icon(FontAwesomeIcons.search),
                                  alignment: Alignment.center,
                                ), onTap: () {
                              loadingOpen(context);
                              ApiService()
                                  .getTakipNotu(RequestData(
                                takipTanimID: takip.takipTanimID,
                                ogretmenID: takip.ogretmenID,
                                gunDDMMYYYY: takip.gunDDMMYYYY,
                              ))
                                  .then((takipNotu) {
                                loadingHide(context);
                                List<Map> formAlanlar = List<Map>.from(
                                        takipNotu.mesaj['FormAlanlar'])
                                    .map((e) => e)
                                    .toList();
                                showCustomDialog(
                                  context,
                                  title: takipNotu.mesaj['TakipTanimAd'],
                                  subTitle: takipNotu.mesaj['OgretmenAd'] +
                                      ' tarafından dolduruldu',
                                  body: Column(
                                    children: formAlanlar
                                        .map((alan) => ListTile(
                                              title: Text(alan['Ad']),
                                              trailing: Text(
                                                  renderDeger(alan['Deger'])),
                                            ))
                                        .toList(),
                                  ),
                                );
                              });
                            }),
                          ]))
                      .toList()),
            )
          : Center(
              child:
                  bos ? noForm() : Center(child: CircularProgressIndicator()),
            ),
    );
  }

  String renderDeger(deger) {
    if (deger == '0') {
      return 'Hayır';
    } else if (deger == '1') {
      return 'Evet';
    } else {
      return deger;
    }
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }
}
