import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:eduasistogrenci/services/contans.dart';
import 'package:flutter/rendering.dart';
import 'package:eduasistogrenci/pages/gunun_cedaylari_page.dart';
import 'package:eduasistogrenci/models/Request.dart';
import 'package:eduasistogrenci/services/api_service.dart';
import 'package:eduasistogrenci/models/Mesaj.dart';

class OnlineDersDetayPage extends StatefulWidget {
  OnlineDersDetayPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _OnlineDersDetayPageState createState() => _OnlineDersDetayPageState();
}

class _OnlineDersDetayPageState extends State<OnlineDersDetayPage> {
  int sonAktifSezonId;
  int sonAktifOkulId;
  DateTime _dateTime;
  String gun;
  String ay;
  String yil;
  String strTarih;
  String nTarih;
  List<Mesaj> list = [];
  List<int> cedayId = new List(10);
  void initState() {
    //service2();
    super.initState();
  }

/*


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
        print(value.durum);
        print(value.sonucId);
        list = value.mesaj;
        print(list);
        for (int x = 0; x < list.length; x++) {
          cedayId[x] = list[x].cedayId;
          print(cedayId[x]);
          print('######################');
          print('##########################ceday id ver $cedayId');
        }
      }
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 100,
            ),
            Center(
              child: Text(
                _dateTime == null ? 'Lütfen önce tarih seçiniz' : STRTarihGun,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            RaisedButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue)),
              child: Text('Tarih seçmek için tıklayın 24'),
              onPressed: () {
                print('Tarih için butona tıklandı.');
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2016),
                        lastDate: DateTime(2022))
                    .then((date) {
                  setState(() {
                    _dateTime = date;
                    gun = _dateTime.day.toString();
                    ay = _dateTime.month.toString();
                    yil = _dateTime.year.toString();
                    STRTarihGun = "$gun.$ay.$yil";
                    STRTarih = "0$gun.$ay.$yil";
                    NTarih = "$yil-$ay-0$gun";
                    NTarihGun = "$yil-$ay-$gun";
                    if (int.parse(gun) < 10) {
                      GUNDDMMYYYY = "0$gun$ay$yil";
                    } else {
                      GUNDDMMYYYY = "$gun$ay$yil";
                    }

                    print(STRTarihGun);
                    print(NTarihGun);
                    print(STRTarih);
                    print(NTarih);
                    print(GUNDDMMYYYY);
                  });
                });
              },
            ),
            SizedBox(
              height: 40,
            ),
            /*
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)),
              color: Colors.white,
              child: Container(
                child: Text('Devam etmek icin tiklayin'),
              ),
              onPressed: () {
                print('butona basildi');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => GununCedaylariScreen(),
                  ),
                );
              },
            ),
             */

            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)),
              color: Colors.white,
              child: Container(
                child: Text('listeye gider gider'),
              ),
              onPressed: () {
                print('butona basildi');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => GununCedaylariScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
