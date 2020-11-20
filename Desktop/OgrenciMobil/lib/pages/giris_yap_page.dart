import 'package:eduasistogrenci/pages/anasayfa_page.dart';
import 'package:eduasistogrenci/services/auth_service.dart';
import 'package:eduasistogrenci/services/contans.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../bottomTabs.dart';

class GirisYapPage extends StatefulWidget {
  @override
  _GirisYapPageState createState() => _GirisYapPageState();
}

class _GirisYapPageState extends State<GirisYapPage> {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

  String _username;
  String _pass;

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: colorPrimary),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              onChanged: (val) {
                if (isPassword) {
                  this._pass = val;
                } else {
                  this._username = val;
                }
              },
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: isPassword == true ? "Şifre" : "Kullanıcı adı",
                  contentPadding: EdgeInsets.all(2),
                  hintStyle: TextStyle(
                      fontSize: 15.0, color: colorPrimary.withOpacity(0.4)),
                  prefixIcon: isPassword == true
                      ? const Icon(
                          Icons.lock_outline,
                          color: colorPrimary,
                        )
                      : const Icon(
                          Icons.person_outline,
                          color: colorPrimary,
                        )))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () {
        if (this._username != null && this._pass != null) {
          loadingOpen(context);
          firebaseMessaging.subscribeToTopic('all');
          firebaseMessaging.getToken().then((fcmToken) {
            // send token server
            print("FCM TOKEN: " + fcmToken);
            AuthService()
                .login(this._username, this._pass, fcmToken)
                .then((value) {
              loadingHide(context);
              if (value.isError) {
                showCustomDialog(context,
                    title: "Giriş Hatası", subTitle: value.errorMessage);
              } else {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (BuildContext context) => Tabs()),
                );
              }
            });
          });
        } else {
          showCustomDialog(context,
              title: "Giriş Hatası",
              subTitle: "Lütfen kullanıcı adı ve şifre giriniz");
        }
      },
      child: MaterialButton(
        onPressed: null,
        child: Text(
          'Giriş Yap',
          style: TextStyle(color: colorPrimary, fontSize: 16),
        ),
        textColor: colorPrimary,
        color: colorPrimary,
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: colorPrimary, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height - 150;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              child: Container(
                  height: MediaQuery.of(context).size.height - 150,
                  width: width,
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    children: <Widget>[
                      Positioned(
                        bottom: 40,
                        child: Container(
                            width: width - 50,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                Image.asset(
                                  appImagesFolder + 'logo.png',
                                  height: 100,
                                ),
                                SizedBox(height: 30),
                                _entryField("Kullanıcı Adı", isPassword: false),
                                _entryField("Şifre", isPassword: true),
                              ],
                            )),
                      ),
                    ],
                  )),
            ),
            Container(
              height: 87,
              padding: EdgeInsets.all(20),
              width: width - 50,
              child: _submitButton(),
            ),
            Container(
              height: 60,
              width: width - 50,
              padding: EdgeInsets.all(20),
              child: Center(
                  child: Text(
                "ŞAFAK OKULLARI © " + getToday(),
                style:
                    TextStyle(color: colorPrimary, fontWeight: FontWeight.w600),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
