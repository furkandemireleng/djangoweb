import 'package:eduasistogrenci/bottomTabs.dart';
import 'package:eduasistogrenci/egitimTabs.dart';
import 'package:eduasistogrenci/pages/anasayfa_page.dart';
import 'package:eduasistogrenci/pages/degerlendirme_page.dart';
import 'package:eduasistogrenci/pages/ders_programi_page.dart';
import 'package:eduasistogrenci/pages/odev_listesi_page.dart';
import 'package:eduasistogrenci/pages/rozetler_page.dart';
import 'package:eduasistogrenci/pages/sinav_sonuclari_page.dart';
import 'package:eduasistogrenci/pages/takip_formlari_page.dart';
import 'package:eduasistogrenci/pages/yoklama_page.dart';
import 'package:flutter/material.dart';
import 'package:eduasistogrenci/services/contans.dart';
import 'package:eduasistogrenci/pages/online_ders_detay_page.dart';

import 'package:flutter/material.dart';

class TakipTabs extends StatefulWidget {
  TakipTabs({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TakipTabsState createState() => _TakipTabsState();
}

class _TakipTabsState extends State<TakipTabs> {
  int _selectedIndex = 1;
  static final _textStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static final _tabs = <Widget>[
    AnasayfaPage(
      key: PageStorageKey('Page1'), //Geri
    ),
    RozetlerPage(
      key: PageStorageKey('Page2'), //Rozetler
    ),
    DegerlendirmePage(
      key: PageStorageKey('Page3'), //Değerlendirme
    ),
    TakipFormlariPage(
      key: PageStorageKey('Page4'), //Formlar
    ),
    EgitimTabs(
      key: PageStorageKey('Page5'), //İleri
    ),
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
      } else if (index == 4) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => EgitimTabs(),
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
            icon: Icon(Icons.grade),
            title: Text(
              'Rozetler',
              style: TextStyle(fontSize: 11.50),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text(
              'Değerlendirme',
              style: TextStyle(fontSize: 10.99),
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              'Formlar',
              style: TextStyle(fontSize: 11.50),
            ),
            icon: Icon(Icons.content_paste),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_right),
            title: Text(
              'İleri',
              style: TextStyle(fontSize: 11.50),
            ),
          ),
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
