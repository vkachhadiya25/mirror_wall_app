import 'package:flutter/cupertino.dart';
import 'package:mirror_wall_app/utils/share_helper.dart';
import 'package:provider/provider.dart';

class HomeProvider with ChangeNotifier {
  List<String>? bookMarkData = [];

  void getBookMark() async {
    ShareHelper shareHelper = ShareHelper();
    bookMarkData = await shareHelper.getBookMark();
    notifyListeners();
  }

  String browser = "Google";

  String get browserSet => browser;

  void setBrowser(String value) {
    browser = value;
    notifyListeners();
  }
}
