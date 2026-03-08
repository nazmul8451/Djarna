import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkCaller {
  static const String _defaultLanguage = 'fr';

  static Map<String, String> _getHeaders(Map<String, String>? customHeaders) {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': _defaultLanguage,
    };
    if (customHeaders != null) {
      headers.addAll(customHeaders);
    }
    return headers;
  }

  static Future<http.Response> get(
    String url, {
    Map<String, String>? headers,
  }) async {
    return await http.get(Uri.parse(url), headers: _getHeaders(headers));
  }

  static Future<http.Response> post(
    String url, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    return await http.post(
      Uri.parse(url),
      headers: _getHeaders(headers),
      body: jsonEncode(body),
    );
  }
}
