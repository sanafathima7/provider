import 'package:api/test.dart';
import 'package:api/test_api.dart';
import 'package:flutter/material.dart';

class ProviderOperation extends ChangeNotifier {
  final sevice = ProviderService();
  bool isLoding = false;
  List<Tests> _posts = [];
  List<Tests> get posts => _posts;
  getAllPosts() async {
    isLoding = true;
    notifyListeners();
    final res = await sevice.getAll();
    _posts = res;
    isLoding = false;
    notifyListeners();
  }

  SendActivity(var body) async {
    isLoding = true;
    notifyListeners();
    final res = await sevice.postMethod(body);
    var data = res;
    isLoding = false;
    notifyListeners();
  }
}
