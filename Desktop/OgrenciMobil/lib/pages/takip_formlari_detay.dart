import 'dart:convert';
import 'package:eduasistogrenci/models/Request.dart';
import 'package:eduasistogrenci/models/TakipNotu.dart';
import 'package:eduasistogrenci/services/api_service.dart';
import 'package:flutter/material.dart';

class TakipFormlariDetayPage extends StatefulWidget {
  int id;
  int ogrid;
  String gun;
  TakipFormlariDetayPage(this.id, this.ogrid, this.gun) : super();
  @override
  _TakipFormlariDetayPageState createState() => _TakipFormlariDetayPageState();
}

@override
class _TakipFormlariDetayPageState extends State<TakipFormlariDetayPage> {
  TakipNotu not;

  void initState() {
    ApiService()
        .getTakipNotu(RequestData(
            takipTanimID: widget.id,
            ogretmenID: widget.ogrid,
            gunDDMMYYYY: widget.gun))
        .then((value) {
      if (value == null) {
      } else {
        setState(() {
          not = value;
        });
      }
    });

    super.initState();
  }

  Widget list(not) {
    return Text(not.mesaj.toString());
  }

  @override
  Widget build(BuildContext context) {
    return not != null
        ? Center(child: list(not))
        : Center(child: CircularProgressIndicator());
  }
}
