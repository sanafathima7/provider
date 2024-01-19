import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:api/test.dart';
import 'package:http/http.dart' as http;

Future<http.Response?> insertTest(Tests data) async {
  try {
    final response = await http.post(
      Uri.parse('http://localhost/php_practice/inserttests.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: json.encode({
        'modId': data.modNum, // Adjust based on your Tests class structure
        'userId': data.userId, // Adjust based on your Tests class structure
      }),
    );

    // Handle different status codes
    if (response.statusCode == 200) {
      return response;
    } else {
      // Print an error message or handle the error as needed
      log('Error during HTTP request. Status code: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    // Handle other exceptions
    log('Error during HTTP request: $e');
    return null;
  }
}
