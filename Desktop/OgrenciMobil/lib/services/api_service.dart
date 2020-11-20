import 'dart:convert';
import 'package:eduasistogrenci/models/Degerlendirme.dart';
import 'package:eduasistogrenci/models/DegerlendirmeNotu.dart';
import 'package:eduasistogrenci/models/DersProgrami.dart';
import 'package:eduasistogrenci/models/GunlukCeday.dart';
import 'package:eduasistogrenci/models/Request.dart';
import 'package:eduasistogrenci/models/Rozet.dart';
import 'package:eduasistogrenci/models/Takip.dart';
import 'package:eduasistogrenci/models/TakipNotu.dart';
import 'package:eduasistogrenci/models/Yoklama.dart';
import 'package:eduasistogrenci/services/api_base_service.dart';
import 'package:eduasistogrenci/models/Ceday.dart';
import 'package:eduasistogrenci/models/GununCedaylariModel.dart';
import 'package:eduasistogrenci/models/CedayGirisLogEkleModel.dart';
import 'package:eduasistogrenci/models/CedayGirisUrlModel.dart';

class ApiService extends ApiBaseService {
  // Api Post
  Future<List<DersProgrami>> getDersProgrami(RequestData requestData) async {
    return this.apiRequest("Ogr/DersProgrami", requestData).then((value) {
      if (value == null || value == "") {
        return null;
      } else {
        dynamic jdata = json.decode(value);
        return List<Map>.from(jdata)
            .map((e) => DersProgrami.fromJson(e))
            .toList();
      }
    });
  }

  Future<List<Yoklama>> getYoklama(RequestData requestData) async {
    return this.apiRequest("Ogr/Yoklama", requestData).then((value) {
      if (value == null || value == "") {
        return null;
      } else {
        dynamic jdata = json.decode(value);
        return List<Map>.from(jdata).map((e) => Yoklama.fromJson(e)).toList();
      }
    });
  }

  Future<List<Degerlendirme>> getDegerlendirmeler(
      RequestData requestData) async {
    return this.apiRequest("Ogr/Degerlendirmeler", requestData).then((value) {
      if (value == null || value == "") {
        return null;
      } else {
        dynamic jdata = json.decode(value);
        return List<Map>.from(jdata)
            .map((e) => Degerlendirme.fromJson(e))
            .toList();
      }
    });
  }

  Future<DegerlendirmeNotu> getDegerlendirmeNotu(
      RequestData requestData) async {
    return this
        .apiRequest("Ogr/DegerlendirmeNotuGoster", requestData)
        .then((value) {
      if (value == null || value == "") {
        return null;
      } else {
        dynamic jdata = json.decode(value);
        return DegerlendirmeNotu.fromJson(jdata);
      }
    });
  }

  Future<List<Rozet>> getRozetler(RequestData requestData) async {
    return this.apiRequest("Ogr/Rozetler", requestData).then((value) {
      if (value == null || value == "") {
        return null;
      } else {
        dynamic jdata = json.decode(value);
        return List<Map>.from(jdata).map((e) => Rozet.fromJson(e)).toList();
      }
    });
  }

  Future<List<Takip>> getTakipFormlari(RequestData requestData) async {
    return this.apiRequest("Ogr/Takipler", requestData).then((value) {
      if (value == null || value == "") {
        return null;
      } else {
        dynamic jdata = json.decode(value);
        return List<Map>.from(jdata).map((e) => Takip.fromJson(e)).toList();
      }
    });
  }

  Future<TakipNotu> getTakipNotu(RequestData requestData) async {
    return this
        .apiRequest("Ogr/TakipFormVerisiModal", requestData)
        .then((value) {
      if (value == null || value == "") {
        return null;
      } else {
        dynamic jdata = json.decode(value);
        return TakipNotu.fromJson(jdata);
      }
    });
  }

  Future<List<Ceday>> getCeday(RequestData requestData) async {
    return this.apiRequest("Ogr/CedayGirisiLogEkle", requestData).then((value) {
      if (value == null || value == "") {
        return null;
      } else {
        dynamic jdata = json.decode(value);
        return List<Map>.from(jdata).map((e) => Ceday.fromJson(e)).toList();
      }
    });
  }

  Future<List<GunlukCeday>> getGunlukCeday(RequestData requestData) async {
    return this.apiRequest("Ogr/GununCedaylari", requestData).then((value) {
      if (value == null || value == "") {
        return null;
      } else {
        dynamic jdata = json.decode(value);
        return List<Map>.from(jdata)
            .map((e) => GunlukCeday.fromJson(e))
            .toList();
      }
    });
  }

  Future<CedayGirisURLModel> getCedayGirisUrl(RequestData requestData) async {
    return this.apiRequest("Ogr/CedayGirisUrl", requestData).then((value) {
      if (value == null || value == "") {
        return null;
      } else {
        dynamic jdata = json.decode(value);
        return CedayGirisURLModel.fromJson(jdata);
      }
    });
  }

  Future<CedayGirisLogEkleModel> getCedayGirisLogEkle(
      RequestData requestData) async {
    return this.apiRequest("Ogr/CedayGirisiLogEkle", requestData).then((value) {
      if (value == null || value == "") {
        return null;
      } else {
        dynamic jdata = json.decode(value);
        return CedayGirisLogEkleModel();
      }
    });
  }

  Future<GununCedaylariModel> getGununCedaylari2(
      RequestData requestData) async {
    return this.apiRequest("Ogr/GununCedaylari", requestData).then((value) {
      if (value == null || value == "") {
        return null;
      } else {
        dynamic jdata = json.decode(value);
        return GununCedaylariModel.fromJson(jdata);
      }
    });
  }
}
