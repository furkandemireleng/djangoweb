import 'package:eduasistogrenci/models/DegerlendirmeNotu.dart';
import 'package:eduasistogrenci/models/Request.dart';
import 'package:eduasistogrenci/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:eduasistogrenci/services/contans.dart';

//import 'package:flutter_html/flutter_html.dart';

class DegerlendirmeGosterPage extends StatefulWidget {
  int text;
  DegerlendirmeGosterPage(this.text) : super();
  @override
  _DegerlendirmeGosterPageState createState() =>
      _DegerlendirmeGosterPageState();
}

@override
class _DegerlendirmeGosterPageState extends State<DegerlendirmeGosterPage> {
  DegerlendirmeNotu not;

  void initState() {
    ApiService()
        .getDegerlendirmeNotu(RequestData(id: widget.text))
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

  @override
  Widget build(BuildContext context) {
    return not != null
        ? AlertDialog(
            title: Text('Değerlendirme notu'),
            content: Container(
              height: 90,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(removeAllHtmlTags(
                        not.mesaj,
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RaisedButton(
                        color: colorPrimary,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child:
                            const Text('TAMAM', style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                ],
              ),
            ))
        : Center(child: CircularProgressIndicator());
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }
}
