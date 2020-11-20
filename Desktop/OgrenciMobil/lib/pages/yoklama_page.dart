import 'package:eduasistogrenci/models/Request.dart';
import 'package:eduasistogrenci/models/Yoklama.dart';
import 'package:eduasistogrenci/services/api_service.dart';
import 'package:eduasistogrenci/services/contans.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class YoklamaPage extends StatefulWidget {
  // var title;

  @override
  _YoklamaPageState createState() => _YoklamaPageState();
  const YoklamaPage({
    Key key,
  }) : super(key: key);
  //YoklamaPage({Key key, this.title}) : super(key: key);
}

class YoklamaViewModel {
  String date;
  String titleDate;
  List<Yoklama> list;
  YoklamaViewModel({
    this.date,
    this.titleDate,
    this.list,
  });
}

class _YoklamaPageState extends State<YoklamaPage> {
  List<YoklamaViewModel> yoklamalar = [];
  final cellWidth = 100.0;
  final cellHeight = 120.0;

  @override
  void initState() {
    ApiService().getYoklama(RequestData()).then((list) {
      if (list == null) {
        oturumuSonlandi(context);
      } else {
        list.forEach((element) {
          int index = yoklamalar
              .indexWhere((yoklama) => yoklama.date == element.tarihGunDate);
          if (index > -1) {
            yoklamalar[index].list.add(element);
          } else {
            yoklamalar.add(YoklamaViewModel(
              date: element.tarihGunDate,
              titleDate: element.tarihGunStr,
              list: [element],
            ));
          }
        });
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yoklama Geçmişi"),
      ),
      body: yoklamalar != null
          ? SingleChildScrollView(
              child: _getBodyWidget(),
            )
          : Center(
              child: Text(
              "Derslerinizde alınan yoklamanız yok ...",
              style: TextStyle(fontSize: 20, color: Colors.black45),
            )),
    );
  }

  Widget _getBodyWidget() {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          flex: 4,
          child: Column(
            children: yoklamalar
                .map(
                  (e) => Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    height: cellHeight,
                    decoration: BoxDecoration(
                      border: Border(),
                    ),
                    child: Text(e.titleDate),
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(
          flex: 11,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: yoklamalar
                  .map(
                    (e) => Container(
                      height: cellHeight,
                      child: Row(
                        children: e.list.length > 0
                            ? e.list
                                .map(
                                  (l) => InkWell(
                                    onTap: () {
                                      showCustomDialog(context,
                                          title: l.dersNo.toString() +
                                              '.Ders ' +
                                              l.bransAd +
                                              '\n- ' +
                                              yoklamaDurumuText(
                                                  l.yoklamaDurumID),
                                          subTitle:
                                              l.ogretmen + ' - ' + l.derslikAd);
                                    },
                                    child: renderCellBox(
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(l.dersNo.toString() + ".Ders"),
                                            Text(yoklamaDurumuText(
                                                l.yoklamaDurumID)),
                                          ],
                                        ),
                                        color: l.yoklamaDurumID == 1
                                            ? null
                                            : Colors.yellow[200]),
                                  ),
                                )
                                .toList()
                            : [renderCellBox(Text(""))],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        )
      ],
    );
  }

  String yoklamaDurumuText(int i) {
    switch (i) {
      case 1:
        return "Geldi";
        break;
      case 2:
        return "Geç geldi";
        break;
      case 3:
        return "İzinli";
        break;
      case 4:
        return "Gelmedi";
        break;
      default:
        return "";
    }
  }

  Widget renderCellBox(Widget child, {Color color}) {
    return Container(
      width: 100,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: cellHeight,
      child: child,
      decoration: BoxDecoration(
        color: color != null ? color : Colors.black12,
        borderRadius: BorderRadius.circular(6.0),
      ),
    );
  }
}
