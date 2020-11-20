import 'package:eduasistogrenci/pages/giris_yap_page.dart';
import 'package:eduasistogrenci/services/auth_service.dart';
import 'package:eduasistogrenci/services/contans.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilimPage extends StatefulWidget {
  @override
  _ProfilimPageState createState() => _ProfilimPageState();
  const ProfilimPage({
    Key key,
  }) : super(key: key);
}

class _ProfilimPageState extends State<ProfilimPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 140,
                    width: 140,
                    child: CircleAvatar(
                      child: Image(
                          image: AssetImage("assets/images/no-avatar.png")),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          selectedSezon != null ? selectedSezon.ad : '',
                          style: TextStyle(fontSize: 22, color: Colors.black45),
                        ),
                        Text(
                          authUser.adSoyad,
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Divider(),
            Column(
              children: authUser.derslikler
                  .map((e) => ListTile(
                        leading: Icon(FontAwesomeIcons.tv),
                        title: Text(e.derslikAd),
                      ))
                  .toList(),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
