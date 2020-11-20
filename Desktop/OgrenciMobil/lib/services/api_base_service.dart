import 'dart:convert';

import 'package:eduasistogrenci/models/Request.dart';
import 'package:eduasistogrenci/services/contans.dart';
import 'package:http/http.dart' as http;

class ApiBaseService {
  String _baseApiUrl = "https://test.api.eduasist.com/api/";

  String _appToken = appToken;

  Future<String> apiRequest(String endPoint, RequestData reqData) async {
    reqData.appToken = _appToken;
    if (authUser != null) {
      reqData.oturumToken = authUser.oturumToken;
      reqData.ogrenciID = authUser.kullaniciID.toString();
    }
    if (selectedSezon != null) {
      reqData.sezonID = selectedSezon.id.toString();
    }
    if (selectedDerslik != null) {
      reqData.derslikID = selectedDerslik.derslikID.toString();
    }
    Map reqMapData = reqData.toMap();
    String jsonReqData = json.encode(reqMapData);
    String url = this._baseApiUrl + endPoint;
    print("###### REQUEST URL: " + url);
    print("###### REQUEST DATA: ####### \n" + jsonReqData);
    var response = await http.post(url,
        headers: {'content-type': 'application/json'}, body: jsonReqData);
    print("###### RESPONSE DATA: ####### \n" +
        response.body +
        "\n ############################ \n ");
    return response.body;
  }
}
