import 'package:eduasistogrenci/models/Ders.dart';
import 'package:eduasistogrenci/models/DersProgrami.dart';
import 'package:eduasistogrenci/models/Gun.dart';
import 'package:eduasistogrenci/models/Request.dart';
import 'package:eduasistogrenci/services/api_service.dart';
import 'package:eduasistogrenci/services/contans.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class DersProgramiPage extends StatefulWidget {
  DersProgramiPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DersProgramiPageState createState() => _DersProgramiPageState();
}

class _DersProgramiPageState extends State<DersProgramiPage> {
  List<DersProgrami> list = [];
  List<Gun> gun = [];

  final cellWidth = 110.0;
  final cellHeight = 60.0;

  @override
  void initState() {
    ApiService().getDersProgrami(RequestData()).then((value) {
      if (value == null) {
        oturumuSonlandi(context);
      } else {
        if (this.mounted) {
          setState(() {
            list = value;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list.length > 0
          ? SingleChildScrollView(
              child: Column(
              children: list.map((e) => _getBodyWidget(e)).toList(),
            ))
          : Align(
              alignment: Alignment.center,
              child: Text(
                "Aktif Bir Ders Programınız Yok !!!",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red[900],
                ),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }

  Widget getGunlist(DersProgrami dersProgrami) {
    var baslamaSaati = DateTime.parse(dersProgrami.baslamaSaati);
    var dersBitisSaati =
        baslamaSaati.add(Duration(minutes: dersProgrami.dersSuresi));

    List<Gun> gun = dersProgrami.gunler.map((entry) => Gun());

    return Container(
      margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 2,
        child: ExpansionTile(
          title: Text(
            "index.toString()",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "",
                style: TextStyle(color: Colors.black45),
              ),
            ],
          ),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  left: 15.0, right: 15.0, bottom: 10.0, top: 5.0),
              child: Center(),
            )
          ],
        ),
      ),
    );
  }

  Widget _getBodyWidget(DersProgrami dersProgrami) {
    var baslamaSaati = DateTime.parse(dersProgrami.baslamaSaati);
    var dersBitisSaati =
        baslamaSaati.add(Duration(minutes: dersProgrami.dersSuresi));
    return Column(
      children: [
        Container(
          child: HorizontalDataTable(
            leftHandSideColumnWidth: 100,
            rightHandSideColumnWidth:
                (dersProgrami.dersSayisi * cellWidth) + 400,
            isFixedHeader: true,
            headerWidgets: List.generate(dersProgrami.dersSayisi + 1, (index) {
              if (index == 0) {
                return SizedBox(
                  height: cellHeight * 0.7,
                );
              }
              if (index != 1) {
                baslamaSaati = baslamaSaati.add(Duration(
                    minutes:
                        dersProgrami.teneffusSr + dersProgrami.dersSuresi));
                dersBitisSaati = dersBitisSaati.add(Duration(
                    minutes:
                        dersProgrami.teneffusSr + dersProgrami.dersSuresi));
              }
              return renderHeadCell(
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Colors.white10),
                      ),
                      color: Colors.blue,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          index.toString() + '. Ders',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          baslamaSaati.hour.toString() +
                              ':' +
                              baslamaSaati.minute.toString() +
                              ' - ' +
                              dersBitisSaati.hour.toString() +
                              ':' +
                              dersBitisSaati.minute.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  height: cellHeight * 0.55);
            }).toList(),
            leftSideItemBuilder: (BuildContext context, int index) {
              return renderCell(Container(
                padding: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: Text(dersProgrami.gunler[index].ad),
              ));
            },
            rightSideItemBuilder: (BuildContext context, int index) {
              List<Ders> dersler = dersProgrami.dersler
                  .where((ders) => ders.gun == (index + 1))
                  .toList();
              return Row(
                children: dersler
                    .map((ders) => renderCell(Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 2),
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(color: Colors.black12),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ders.derslikAd,
                                style: TextStyle(color: Colors.black38),
                              ),
                              Text(
                                ders.bransAd,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13.5,
                                ),
                              ),
                              Text(
                                ders.ogretmenAd,
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 12.5,
                                ),
                              ),
                            ],
                          ),
                        )))
                    .toList(),
              );
            },
            itemCount: dersProgrami.gunler.length,
            rowSeparatorWidget: const Divider(
              color: Colors.black54,
              height: 1.0,
              thickness: 0.0,
            ),
            leftHandSideColBackgroundColor: Colors.white,
            rightHandSideColBackgroundColor: Colors.white,
          ),
          height: cellHeight * (dersProgrami.gunler.length + 1),
        ),
      ],
    );
  }

  Widget renderCell(Widget child, {double height}) {
    return Container(
      width: cellWidth,
      height: height != null ? height : cellHeight,
      child: child,
    );
  }

  Widget renderHeadCell(Widget child, {double height}) {
    return Container(
      width: cellWidth,
      height: height != null ? height + 10 : cellHeight,
      child: child,
    );
  }
}
