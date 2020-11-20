
class RaporData {
  int raporGrafikTip;
  String raporSeviye;

  bool isError;
  String errorMessage;

  RaporData(
      {this.raporGrafikTip,
      this.raporSeviye,
      this.isError,
      this.errorMessage});

  factory RaporData.fromJson(Map jdata) {
    return RaporData(
      raporGrafikTip:
          jdata["RaporGrafikTip"] != null ? jdata["RaporGrafikTip"] : 0,
      raporSeviye: jdata["RaporSeviye"] != null ? jdata["RaporSeviye"] : "",
      isError: jdata["isError"] != null ? jdata["isError"] : false,
      errorMessage: jdata["ErrorMessage"] != null
          ? jdata["ErrorMessage"]
          : "Beklenmedik Hata",
    );
  }
}
