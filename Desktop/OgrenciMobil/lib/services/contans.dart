import 'package:eduasistogrenci/models/Derslik.dart';
import 'package:eduasistogrenci/models/Sezon.dart';
import 'package:eduasistogrenci/models/User.dart';
import 'package:eduasistogrenci/pages/giris_yap_page.dart';
import 'package:eduasistogrenci/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

// SETTINGS
const String appToken = "ec231951-5a81-40d0-a760-21f682e42a73";
const String appName = "Şafak Okulları Öğrenci";
const appImagesFolder = 'assets/images/safak/';

// COLORS
const Color colorPrimary = Color(0xffaa2431); // Color(0xff00758d);
const Color colorSecondary = Color(0xff4a4f54);
const Color colorDark = Color(0xff171717);
const Color colorwhite = Colors.white;

// default spacing
double spacing(value) => value * 8.0;

// GLOBAL VARs
User authUser;
int OGRENCIID = authUser.kullaniciID;
//
Sezon selectedSezon;
int SECILENSEZON = selectedSezon.id;
Derslik selectedDerslik;
int DERSLIKID = selectedDerslik.derslikID;
int SONAKTIFSEZONID;
int SONAKTIFOKULID;
String STRTarihGun;
String NTarihGun;
String STRTarih;
String NTarih;
String GUNDDMMYYYY;
DateTime date = DateTime.now();

// GLOBAL WIDGETs
Widget circularContainer(double height, Color color,
    {Color borderColor = Colors.transparent, double borderWidth = 2}) {
  return Container(
    height: height,
    width: height,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: color,
      border: Border.all(color: borderColor, width: borderWidth),
    ),
  );
}

Future<void> showCustomDialog(
  context, {
  String title,
  String subTitle,
  String okText,
  List<FlatButton> buttons,
  Widget body,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title != null ? title : ''),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(subTitle != null ? subTitle : ''),
              body != null ? body : Text(''),
            ],
          ),
        ),
        actions: buttons != null
            ? buttons
            : <Widget>[
                FlatButton(
                  child: Text(okText != null ? okText : 'Tamam'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
      );
    },
  );
}

void openSnackBar(context, text) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(text),
    duration: Duration(seconds: 1),
  ));
}

void loadingOpen(context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Material(
          type: MaterialType.transparency,
          child: new Container(
            child: Center(
                child: Column(
              children: [
                SizedBox(
                  height: 275,
                ),
                CircularProgressIndicator(),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Yükleniyor",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                )
              ],
            )),
          ));
    },
  );
}

void loadingHide(context) {
  Navigator.of(context).pop();
}

String getToday() {
  return date.year.toString();
}

void oturumuSonlandi(context, {bool isModal = false}) {
  AuthService().logout().then((value) {
    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => GirisYapPage(),
          transitionDuration: Duration(seconds: 0),
        ),
        ModalRoute.withName("/"));
  });
}
