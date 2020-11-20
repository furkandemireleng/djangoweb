import 'package:eduasistogrenci/models/Request.dart';
import 'package:eduasistogrenci/models/Rozet.dart';
import 'package:eduasistogrenci/services/api_service.dart';
import 'package:eduasistogrenci/services/contans.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class RozetlerPage extends StatefulWidget {
  var title;

  @override
  _RozetlerPageState createState() => _RozetlerPageState();
  RozetlerPage({Key key, this.title}) : super(key: key);
}

Map<int, Color> color = {
  50: Color.fromRGBO(255, 218, 0, 1),
  100: Color.fromRGBO(255, 218, 0, 1),
  200: Color.fromRGBO(255, 218, 0, 1),
  300: Color.fromRGBO(255, 218, 0, 1),
  400: Color.fromRGBO(255, 218, 0, 1),
  500: Color.fromRGBO(255, 218, 0, 1),
  600: Color.fromRGBO(255, 218, 0, 1),
  700: Color.fromRGBO(255, 218, 0, 1),
  800: Color.fromRGBO(255, 218, 0, 1),
  900: Color.fromRGBO(255, 218, 0, 1),
};
MaterialColor myColor = MaterialColor(0xFFaa2431, color);

class _RozetlerPageState extends State<RozetlerPage> {
  String rozetImageBaseUrl = 'https://test.eduasist.com';

  List<Rozet> rozetler = [];
  bool bos = false;
  @override
  void initState() {
    ApiService().getRozetler(RequestData()).then((list) {
      if (list.isEmpty) {
        setState(() {
          bos = true;
        });
      } else {
        setState(() {
          rozetler = list;
          bos = false;
        });
      }
    });
    super.initState();
  }

  Widget rozetlerWidget(rozet) {
    return Container(
      margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 2,
        child: ExpansionTile(
          leading: Image.network(rozetImageBaseUrl + rozet.ikonUrl),
          title: Text(
            rozet.rozetAd,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                rozet.bransAd,
                style: TextStyle(color: Colors.black45),
              ),
              Text(
                "Puan : " + rozet.puan.toString(),
                style: TextStyle(color: Colors.black45),
              ),
            ],
          ),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  left: 15.0, right: 15.0, bottom: 10.0, top: 5.0),
              child: Center(
                child: Text(rozet.aciklama),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget noRozet() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.cancel, size: 80, color: myColor),
          SizedBox(height: 10),
          Text(
            "Hiç rozetin yok",
            style: TextStyle(fontSize: 20, color: Colors.black45),
          ),
          Row(),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: rozetler.length > 0
          ? SingleChildScrollView(
              child: Column(
              children: rozetler.map((e) => rozetlerWidget(e)).toList(),
            ))
          : Container(
              child:
                  bos ? noRozet() : Center(child: CircularProgressIndicator()),
            ),
    );
  }
}
