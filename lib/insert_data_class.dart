import 'package:api/insert_service.dart';
import 'package:api/test.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataClass extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;

  Future<void> postData(Tests body) async {
    loading = true;
    notifyListeners();

    try {
      http.Response? response = await insertTest(body);

      // Use null-aware operator to check if response is not null
      if (response != null && response.statusCode == 200) {
        isBack = true;
      } else {
        // Handle other status codes or errors
        print('Error: ${response?.statusCode}');
      }
    } catch (error) {
      // Handle other errors (e.g., network issues)
      print('Error: $error');
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
