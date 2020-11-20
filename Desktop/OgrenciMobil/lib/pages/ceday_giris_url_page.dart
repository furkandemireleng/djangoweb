import 'package:date_format/date_format.dart';
import 'package:eduasistogrenci/models/CedayGirisLogEkleModel.dart';
import 'package:eduasistogrenci/models/CedayGirisURLModel.dart';
import 'package:eduasistogrenci/models/Mesaj.dart';
import 'package:flutter/material.dart';
import 'package:eduasistogrenci/services/contans.dart';
import 'package:eduasistogrenci/services/api_service.dart';
import 'package:eduasistogrenci/models/Request.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:eduasistogrenci/services/contans.dart';

class CedayGirisUrlScreen extends StatefulWidget {
  int cedayId;
  CedayGirisUrlScreen({this.cedayId});
  @override
  _CedayGirisUrlScreenState createState() => _CedayGirisUrlScreenState();
}

class _CedayGirisUrlScreenState extends State<CedayGirisUrlScreen> {
  CedayGirisURLModel cedayGirisURLModel;
  CedayGirisLogEkleModel cedayGirisLogEkleModel;
  Mesaj mesaj;
  String zoomUrl, webUrl, katilimLogParametresi;

  void initState() {
    super.initState();
    print(widget.cedayId);
    service2();
  }

  void service2() async {
    await ApiService()
        .getCedayGirisUrl(RequestData(
      cedayID: widget.cedayId,
      ogrenciID: OGRENCIID.toString(),
      sezonID: SECILENSEZON.toString(),
      derslikID: DERSLIKID.toString(),
    ))
        .then((value) {
      if (value == null) {
        print('hata');
      } else {
        webUrl = value.mesaj.webUrl;
        zoomUrl = value.mesaj.zoomUrl;
        katilimLogParametresi = value.mesaj.katilimLogParametresi;
        print(katilimLogParametresi);
        print(zoomUrl);
        print(webUrl);
      }
    });
  }

  void service3() async {
    await ApiService()
        .getCedayGirisLogEkle(RequestData(
      ogrenciID: OGRENCIID.toString(),
      sezonID: SECILENSEZON.toString(),
      derslikID: DERSLIKID.toString(),
      katilimLogParametresi: katilimLogParametresi,
    ))
        .then((value) {
      if (value == null) {
        print('hata');
      } else {
        print('log calisiyorrrr');
        print(value);
      }
    });
  }

  void launchURLZoom() async {
    service3();
    var url = '$zoomUrl';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchURLWeb() async {
    service3();
    var url = '$webUrl';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ceday Giris'),
      ),
      body: webUrl != ""
          ? Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    width: 150,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26.0),
                        side: BorderSide(color: Colors.white),
                      ),
                      color: Colors.redAccent,
                      onPressed: launchURLWeb,
                      child: Container(
                        child: Text(
                          'Derse katıl',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)),
                color: Colors.white,
                child: Container(
                  width: 200,
                  child: ListTile(
                      leading: Icon(Icons.cached),
                      title: Text('push me'),
                      trailing: Icon(Icons.cached)),
                ),
                onPressed: () {
                  setState(() {
                    service2();
                  });
                },
              ),
            ),
    );
  }
}

/*
calisan
Scaffold(
      appBar: AppBar(
        title: Text('Ceday Giris'),
      ),
      body: webUrl != ""
          ? Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    width: 150,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26.0),
                        side: BorderSide(color: Colors.white),
                      ),
                      color: Colors.redAccent,
                      onPressed: launchURLWeb,
                      child: Container(
                        child: Text(
                          'Derse katıl',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)),
                color: Colors.white,
                child: Container(
                  width: 200,
                  child: ListTile(
                      leading: Icon(Icons.cached),
                      title: Text('push me'),
                      trailing: Icon(Icons.cached)),
                ),
                onPressed: () {
                  setState(() {
                    service2();
                  });
                },
              ),
            ),
    );
 */
/*
widget.cedayId != 0
          ? Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    width: 150,
                    /* child: zoomUrl == ""
                        ? null
                        : RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(26.0),
                                side: BorderSide(color: Colors.white)),
                            color: Colors.blueAccent,
                            onPressed: launchURLZoom,
                            child: Container(
                                child: Text(
                              'Derse katıl',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            )),
                          ),
                  ),
                  SizedBox(
                    height: zoomUrl == "" ? 0 : 15,
                  ),
                  SizedBox(
                    width: 150,*/
                    child: webUrl == ""
                        ? null
                        : RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26.0),
                              side: BorderSide(color: Colors.white),
                            ),
                            color: Colors.redAccent,
                            onPressed: launchURLWeb,
                            child: Container(
                              child: Text(
                                'Derse katıl',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            )
          : Center(
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)),
                color: Colors.white,
                child: Container(
                  width: 200,
                  child: ListTile(
                      leading: Icon(Icons.cached),
                      title: Text('push me'),
                      trailing: Icon(Icons.cached)),
                ),
                onPressed: () {
                  setState(() {
                    service2();
                  });
                },
              ),
            ),
 */

/*
webUrl != ""
          ? Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    width: 150,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26.0),
                        side: BorderSide(color: Colors.white),
                      ),
                      color: Colors.redAccent,
                      onPressed: launchURLWeb,
                      child: Container(
                        child: Text(
                          'Derse katıl',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                color: Colors.white,
                child: Container(
                  width: 200,
                  child: ListTile(
                      leading: Icon(Icons.cached),
                      title: Text('yenile'),
                      trailing: Icon(Icons.cached)),
                ),
                onPressed: () {
                  setState(() {
                    service2();
                  });
                },
              ),
            ),
 */
