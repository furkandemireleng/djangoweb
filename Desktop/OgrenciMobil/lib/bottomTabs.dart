import 'package:eduasistogrenci/egitimTabs.dart';
import 'package:eduasistogrenci/pages/anasayfa_page.dart';
import 'package:eduasistogrenci/takipTabs.dart';
import 'package:flutter/material.dart';
import 'package:eduasistogrenci/services/contans.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedIndex = 0;
  static final _textStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static final _tabs = <Widget>[
    AnasayfaPage(
      key: PageStorageKey('Anapage'),
    ),
    TakipTabs(
      key: PageStorageKey('TakipTabs'),
    ),
    EgitimTabs(
      key: PageStorageKey('EgitimTab'),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      if (index == 2) {
        if (selectedDerslik != null && selectedSezon != null) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => EgitimTabs(),
              transitionDuration: Duration(seconds: 0),
            ),
          );
        } else {
          print("seçilmedi");
          _showDialog();
        }
      } else if (index == 1) {
        if (selectedDerslik != null && selectedSezon != null) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => TakipTabs(),
              transitionDuration: Duration(seconds: 0),
            ),
          );
        } else {
          print("seçilmedi");
          _showDialog();
        }
      } else {
        _selectedIndex = index;
      }
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: new Text("Derslik ve sezon seçimi yapınız."),
          actions: <Widget>[
            new FlatButton(
              textColor: Color(0xFFaa2431),
              child: new Text("TAMAM"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)]),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Anasayfa'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.insert_chart),
              title: Text('Takip'),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.graduationCap),
              title: Text('Eğitim'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
          backgroundColor: myColor,
          unselectedItemColor: Colors.white30,
        ),
      ),
    );
  }
}
