import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'custom_exception.dart';

class HttpService {
  HttpService._();

  static final HttpService _instance = HttpService._();

  factory HttpService() {
    return _instance;
  }

  // Private method to get headers, including the token if available
  Map<String, String> _getHeaders(String? authToken) {
    final headers = {
      'x-rapidapi-host': 'cricbuzz-cricket.p.rapidapi.com',
      'x-rapidapi-key': 'f0967aea64mshcf72e88e4acd31ap19a40cjsn156e3336d86b'
    };
    return headers;
  }

  // GET request
  Future<Map<String, dynamic>?> get(String endpoint) async {
    try {
      final response = await http
          .get(
            Uri.parse(endpoint),
            headers: _getHeaders(null),
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return null;
      }
    } on SocketException {
      throw FetchDataException();
    } on TimeoutException {
      throw TimeOutException();
    } catch (e, s) {
      debugPrint("Api error in getMethod $e $s");
      return null;
    }
  }
}
