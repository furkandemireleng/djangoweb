import 'package:eduasistogrenci/models/Degerlendirme.dart';
import 'package:eduasistogrenci/models/Request.dart';
import 'package:eduasistogrenci/pages/degerlendirme_goster_page.dart';
import 'package:eduasistogrenci/services/api_service.dart';
import 'package:eduasistogrenci/services/contans.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DegerlendirmePage extends StatefulWidget {
  var title;

  @override
  _DegerlendirmePageState createState() => _DegerlendirmePageState();
  DegerlendirmePage({Key key, this.title}) : super(key: key);
}

extension ExtendedIterable<E> on Iterable<E> {
  Iterable<T> mapIndex<T>(T f(E e, int i)) {
    var i = 0;
    return this.map((e) => f(e, i++));
  }

  void forEachIndex(void f(E e, int i)) {
    var i = 0;
    this.forEach((e) => f(e, i++));
  }
}

@override
class _DegerlendirmePageState extends State<DegerlendirmePage> {
  List<Degerlendirme> degerlendirmeler = [];
  String tempnote;
  bool bos = false;

  @override
  void initState() {
    ApiService().getDegerlendirmeler(RequestData()).then((value) {
      if (value.isEmpty) {
        setState(() {
          bos = true;
        });
      } else {
        setState(() {
          degerlendirmeler = value;
          bos = false;
        });
      }
    });

    ApiService().getDegerlendirmeNotu(RequestData(id: 0)).then((value) {
      if (value == null) {
      } else {
        print(value.mesaj);
      }
    });

    super.initState();
  }

  Widget showDetay(i) {
    return DegerlendirmeGosterPage(i);
  }

  Widget noDeger() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.cancel, size: 80, color: colorPrimary),
          SizedBox(height: 10),
          Text(
            "Hiç değerlendirme yok",
            style: TextStyle(fontSize: 20, color: Colors.black45),
          ),
          Row(),
        ]);
  }

  Widget degerlendirmeCard(degerlendirmeler, i) {
    return GestureDetector(
        onTap: () {
          showDialog(
              context: context, builder: (_) => showDetay(degerlendirmeler.id));
        },
        child: Container(
          margin:
              EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0, top: 15.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 2,
            child: ListTile(
              title: Text(
                degerlendirmeler.baslik,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                children: [
                  Row(
                    children: [
                      Text(degerlendirmeler.ogretmen),
                    ],
                  ),
                  Row(
                    children: [
                      Text(degerlendirmeler.bransAd),
                    ],
                  ),
                ],
              ),
              trailing: RaisedButton(
                color: colorPrimary,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => showDetay(degerlendirmeler.id));
                },
                child: const Text('Detay', style: TextStyle(fontSize: 15)),
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: degerlendirmeler.length > 0
          ? SingleChildScrollView(
              child: Column(
              children: degerlendirmeler
                  .mapIndex((e, i) => degerlendirmeCard(e, i))
                  .toList(),
            ))
          : Container(
              child:
                  bos ? noDeger() : Center(child: CircularProgressIndicator()),
            ),
    );
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }
}
