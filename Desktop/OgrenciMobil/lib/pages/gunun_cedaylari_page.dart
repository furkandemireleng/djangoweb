import 'package:flutter/material.dart';
import 'package:eduasistogrenci/models/Request.dart';
import 'package:eduasistogrenci/services/api_service.dart';
import 'package:eduasistogrenci/models/GununCedaylariModel.dart';
import 'package:eduasistogrenci/models/Mesaj.dart';
import 'package:eduasistogrenci/services/contans.dart';
import 'package:eduasistogrenci/pages/ceday_giris_url_page.dart';

class GununCedaylariScreen extends StatefulWidget {
  @override
  _GununCedaylariScreenState createState() => _GununCedaylariScreenState();
}

class _GununCedaylariScreenState extends State<GununCedaylariScreen> {
  GununCedaylariModel gununCedaylariModel;
  int cedayId;
  List<int> cedayIds = [];
  List<Mesaj> list = [];
  int i;
  int index;
  int sure;
  String ogretmenadSoyad;
  List<String> ogretmenList = [];

  void initState() {
    super.initState();
    service2();
  }

  void service2() async {
    await ApiService()
        .getGununCedaylari2(RequestData(
      gunDDMMYYYY: GUNDDMMYYYY,
      ogrenciID: OGRENCIID.toString(),
      sezonID: SECILENSEZON.toString(),
      derslikID: DERSLIKID.toString(),
    ))
        .then((value) {
      if (value == null) {
        print('hata');
      } else {
        print('################');
        index = value.mesaj.length;
        print(index);
        for (i = 0; i < index; i++) {
          cedayId = value.mesaj[i].cedayId;
          ogretmenadSoyad = value.mesaj[i].ogretmenAd;
          ogretmenList.add(ogretmenadSoyad);
          cedayIds.add(cedayId);
          print(cedayIds);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gunun Cedaylari'),
      ),
      body: cedayIds.length == index
          ? ListView.builder(
              itemCount: cedayIds.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    print(cedayIds[index]);
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              CedayGirisUrlScreen(
                            cedayId: cedayIds[index],
                          ),
                        ),
                      );
                    });
                  },
                  leading: Icon(
                    Icons.person,
                    color: Colors.red,
                  ),
                  title: Text('${ogretmenList[index]}'),
                  subtitle: Text('${cedayIds[index]}'),
                );
              },
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
                  cedayIds.length > index ? Navigator.pop(context) : service2();
                });
              },
            )),
    );
  }
}

/*
Scaffold(
      appBar: AppBar(
        title: Text('Gunun Cedaylari'),
      ),
      body: ogretmenList.length == index
          ? ListView.builder(
              itemCount: cedayIds.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              CedayGirisUrlScreen(
                            cedayId: cedayId,
                          ),
                        ),
                      );
                    });
                  },
                  leading: Icon(
                    Icons.person,
                    color: Colors.red,
                  ),
                  title: Text('${ogretmenList[index]}'),
                  subtitle: Text('${cedayIds[index]}'),
                );
              },
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
                  cedayIds.length > index ? Navigator.pop(context) : service2();
                });
              },
            )),
    );
 */

/*
Scaffold(
      appBar: AppBar(
        title: Text('Gunun Cedaylari'),
      ),
      body: ogretmenList.length == index
          ? ListView.builder(
              itemCount: cedayIds.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              CedayGirisUrlScreen(
                            cedayId: cedayId,
                          ),
                        ),
                      );
                    });
                  },
                  leading: Icon(
                    Icons.person,
                    color: Colors.red,
                  ),
                  title: Text('${ogretmenList[index]}'),
                  subtitle: Text('${cedayIds[index]}'),
                );
              },
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
    )
 */
