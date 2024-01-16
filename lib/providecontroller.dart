// import 'dart:developer';

// import 'package:api/provider.dart';
// import 'package:flutter/material.dart';

// class Providercontroller extends ChangeNotifier{
//   final service = Testprovider();
//   bool isLoading = false;
//   List<Post>
  
// Tests? _test;
//   TestApi? _testApi;

//   Testprovider({TestApi? testApi}) : _testApi = testApi ?? TestApi(Dio());

//   Tests? get test => _test;
//   Future<void> fetchuser(int user_id) async {
//     try {
//       _test = await _testApi?.getUser(user_id);
//       notifyListeners();
//     } catch (e) {}
//   }
// }