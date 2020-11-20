import 'package:eduasistogrenci/models/DersProgrami.dart';
//import 'package:eduasistogrenci/models/GunlukCeday.dart';
//import 'package:eduasistogrenci/models/User.dart';
//import 'package:eduasistogrenci/pages/dokuman_listesi_page.dart';
import 'package:eduasistogrenci/services/auth_service.dart';
import 'package:eduasistogrenci/services/contans.dart';
import 'package:flutter/material.dart';
import 'package:eduasistogrenci/services/api_service.dart';
import 'package:eduasistogrenci/models/Request.dart';

class AnasayfaPage extends StatefulWidget {
  var title;
  @override
  AnasayfaPage({Key key, this.title}) : super(key: key);

  _AnasayfaPageState createState() => _AnasayfaPageState();
}

class _AnasayfaPageState extends State<AnasayfaPage> {
  List<DersProgrami> list = [];
  String today;
  @override
  void initState() {
    ApiService().getDersProgrami(RequestData()).then((value) {
      if (value == null) {
        oturumuSonlandi(context);
      } else {
        if (this.mounted) {
          setState(() {
            list = value;
            today = list[0].gunler[int.parse(getToday()) - 1].ad.toString();

            for (var i = 0; i < list[0].dersler.length; i++) {
              if (list[i].dersler[i].gun ==
                  list[i].gunler[int.parse(getToday()) - 1]) {
                print(list[i].dersler[i].bransAd.toString());
              }
            }

            print(
                list[0].dersler[int.parse(getToday()) - 1].bransAd.toString());
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.0),
      child: Scaffold(
          body: SingleChildScrollView(
              child: Column(
        children: [
          Container(
            height: 50,
            margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0),
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [],
                    ),
                  ],
                )),
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0),
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Sezon: "),
                    DropdownButton(
                      iconEnabledColor: colorPrimary,
                      hint: Text(
                        selectedSezon == null
                            ? 'Sezon Seçiniz'
                            : selectedSezon.ad,
                        style: selectedSezon == null
                            ? TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: colorPrimary)
                            : TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                      value: selectedSezon == null ? null : selectedSezon.id,
                      items: authUser.sezonlar
                          .map((sezon) => DropdownMenuItem(
                                child: Text(sezon.ad),
                                value: sezon.id,
                              ))
                          .toList(),
                      onChanged: (sezonId) {
                        setState(() {
                          selectedSezon = authUser.sezonlar
                              .where((element) => element.id == sezonId)
                              .first;
                          AuthService().setSavedSezon(sezonId);
                        });
                      },
                    ),
                    Text("Derslik: "),
                    DropdownButton(
                      iconEnabledColor: colorPrimary,
                      hint: Text(
                        selectedDerslik == null
                            ? 'Derslik Seçiniz'
                            : selectedDerslik.derslikAd,
                        style: selectedDerslik == null
                            ? TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: colorPrimary)
                            : TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                      value: selectedDerslik == null
                          ? null
                          : selectedDerslik.derslikID,
                      items: authUser.derslikler
                          .map((derslik) => DropdownMenuItem(
                                child: Text(derslik.derslikAd),
                                value: derslik.derslikID,
                              ))
                          .toList(),
                      onChanged: (derslikId) {
                        setState(() {
                          selectedDerslik = authUser.derslikler
                              .where(
                                  (element) => element.derslikID == derslikId)
                              .first;
                          AuthService().setSavedDerslik(derslikId);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ))),
    );
  }
}
