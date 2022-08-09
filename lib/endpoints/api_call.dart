import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiCall {
  static Future<http.Response>? getRequest(String url) {
    try {
      return http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
    } on TimeoutException catch (_) {
      log("Server Time Out");
      return null;
    } on SocketException catch (_) {
      log("Socket Exception");
      return null;
    }
  }

  static Future<http.Response>? deleteRequest(String url) {
    try {
      return http.delete(Uri.parse(url)).timeout(const Duration(seconds: 30));
    } on TimeoutException catch (_) {
      log("Server Time Out");
      return null;
    } on SocketException catch (_) {
      log("Socket Exception");
      return null;
    }
  }

  static Future<http.Response>? postRequest(String url, Map data) {
    try {
      return http.post(Uri.parse(url), body: jsonEncode(data), headers: {"Content-Type": "application/json"}).timeout(const Duration(seconds: 30));
    } on TimeoutException catch (_) {
      log("Server Time Out");
      return null;
    } on SocketException catch (_) {
      log("Socket Exception");
      return null;
    }
  }

  static Future<http.Response>? postRegistrationRequest(String url, var data) {
    try {
      return http.post(Uri.parse(url), body: data).timeout(const Duration(seconds: 30));
    } on TimeoutException catch (_) {
      log("Server Time Out");
      return null;
    } on SocketException catch (_) {
      log("Socket Exception");
      return null;
    }
  }
}
