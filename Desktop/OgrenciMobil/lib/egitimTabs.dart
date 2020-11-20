import 'package:eduasistogrenci/bottomTabs.dart';
//import 'package:eduasistogrenci/models/DersProgrami.dart';
import 'package:eduasistogrenci/pages/anasayfa_page.dart';
import 'package:eduasistogrenci/pages/ders_programi_page.dart';
/*import 'package:eduasistogrenci/pages/odev_listesi_page.dart';
import 'package:eduasistogrenci/pages/profilim_page.dart';
import 'package:eduasistogrenci/pages/sinav_sonuc_detay_page.dart';
import 'package:eduasistogrenci/pages/sinav_sonuclari_page.dart';*/
//import 'package:eduasistogrenci/pages/yoklama_page.dart';
import 'package:flutter/material.dart';
import 'package:eduasistogrenci/services/contans.dart';
/*import 'package:eduasistogrenci/services/auth_service.dart';
import 'package:eduasistogrenci/pages/giris_yap_page.dart';*/
//import 'package:eduasistogrenci/pages/online_ders_detay_page.dart';
import 'package:eduasistogrenci/pages/onlineders.dart';

//import 'package:eduasistogrenci/services/auth_service.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EgitimTabs extends StatefulWidget {
  EgitimTabs({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EgitimTabsState createState() => _EgitimTabsState();
}

class _EgitimTabsState extends State<EgitimTabs> {
  int _selectedIndex = 1;
  static final _textStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static final _tabs = <Widget>[
    AnasayfaPage(
      key: PageStorageKey('Page1'), //Geri
    ),
    OnlineDersDetayPage(
      key: PageStorageKey('Page2'), //CEDAY
    ),
    DersProgramiPage(
      key: PageStorageKey('Page3'), //Program
    ),
    /*
    OdevListesiPage(
      key: PageStorageKey('Page4'), //Ödevler
    ),
    SinavSonuclariPage(
      key: PageStorageKey('Page5'), //Sınav
    ),
    YoklamaPage(
      key: PageStorageKey('Page6'), //Yoklama
    ),*/
  ];
  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => Tabs(),
            transitionDuration: Duration(seconds: 0),
          ),
        );
      }
      _selectedIndex = index;
    });
  }

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: AppBar(
        title: Text(authUser.adSoyad,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17)),
        backgroundColor: myColor,
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              showCustomDialog(context,
                  title: "Oturumu Kapat",
                  subTitle: "Çıkış yapmak istediğinize emin misiniz?",
                  buttons: [
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Vazgeç"),
                    ),
                    FlatButton(
                      onPressed: () {
                        oturumuSonlandi(context, isModal: true);
                      },
                      child: Text("Çıkış Yap"),
                    ),
                  ]);
            },
            child: Text("Çıkış"),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          )
        ],
        /* bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: Text(
            'This is the home page',
            style: TextStyle(fontSize: 24),
          ),
        ),*/
      ),
      body: Center(
        child: IndexedStack(
          children: _tabs.map((t) => t).toList(),
          index: _selectedIndex,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_left),
            title: Text('Geri'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            title: Text('Ceday'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text('Program'),
          ),
          /*
          BottomNavigationBarItem(
            title: Text('Ödevler'),
            icon: Icon(Icons.content_paste),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.equalizer),
            title: Text('Sınav'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.import_contacts),
            title: Text('Yoklama'),
          ),*/
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
        backgroundColor: myColor,
        unselectedItemColor: Colors.white30,
      ),
    );
  }
}
