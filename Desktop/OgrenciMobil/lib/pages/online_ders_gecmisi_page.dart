/*import 'package:eduasistogrenci/pages/online_ders_detay_page.dart';
import 'package:eduasistogrenci/services/contans.dart';
import 'package:flutter/material.dart';

class OnlineDersGecmisiPage extends StatefulWidget {
  @override
  _OnlineDersGecmisiPageState createState() => _OnlineDersGecmisiPageState();
}

class DersItem {
  String title;
  String subTitle;
  String date;
  bool isPlay;
  DersItem({this.title, this.subTitle, this.date, this.isPlay: false});
}

class _OnlineDersGecmisiPageState extends State<OnlineDersGecmisiPage> {
  List<DersItem> list = [
    DersItem(
        title: "Matematik",
        subTitle: "Serhat Mercan",
        date: "02/05/2020",
        isPlay: true),
    DersItem(
        title: "Matematik",
        subTitle: "Serhat Mercan",
        date: "02/05/2020",
        isPlay: true),
    DersItem(title: "Matematik", subTitle: "Serhat Mercan", date: "02/05/2020"),
    DersItem(title: "Matematik", subTitle: "Serhat Mercan", date: "02/05/2020"),
    DersItem(title: "Matematik", subTitle: "Serhat Mercan", date: "02/05/2020"),
    DersItem(title: "Matematik", subTitle: "Serhat Mercan", date: "02/05/2020"),
    DersItem(title: "Matematik", subTitle: "Serhat Mercan", date: "02/05/2020"),
    DersItem(title: "Matematik", subTitle: "Serhat Mercan", date: "02/05/2020"),
    DersItem(title: "Matematik", subTitle: "Serhat Mercan", date: "02/05/2020"),
    DersItem(title: "Matematik", subTitle: "Serhat Mercan", date: "02/05/2020"),
    DersItem(title: "Matematik", subTitle: "Serhat Mercan", date: "02/05/2020"),
    DersItem(title: "Matematik", subTitle: "Serhat Mercan", date: "02/05/2020"),
    DersItem(title: "Matematik", subTitle: "Serhat Mercan", date: "02/05/2020"),
    DersItem(title: "Matematik", subTitle: "Serhat Mercan", date: "02/05/2020"),
    DersItem(title: "Matematik", subTitle: "Serhat Mercan", date: "02/05/2020"),
    DersItem(title: "Matematik", subTitle: "Serhat Mercan", date: "02/05/2020"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Online Ders Geçmişi"),
        ),
        body: ListView(
          children: list
              .map(
                (DersItem item) => ListTile(
                  onTap: () {
                    if(item.isPlay){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => OnlineDersDetayPage(),
                        ),
                      );
                    } else {
                      showCustomDialog(context, title: "Henüz Hazır Değil");
                    }
                  },
                  title: Text(item.title, style: TextStyle(fontSize: 20),),
                  subtitle: Text(item.subTitle, style: TextStyle(fontSize: 15),),
                  dense: true,
                  leading: Icon(
                    Icons.play_circle_outline,
                    color: (item.isPlay ? Colors.blue : Colors.black45),
                  ),
                ),
              )
              .toList(),
        ));
  }
}*/
