import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static String? _accessToken;
  static String? _refreshToken;

  static String? get accessToken => _accessToken;

  static Future<void> setAccessToken(String token) async {
    _accessToken = token;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', token);
  }

  static Future<void> loadAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    _accessToken = prefs.getString('access_token');
  }

  static Future<void> clearAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    _accessToken = null;
  }

  // الـ refresh token
  static Future<void> saveRefreshToken(String token) async {
    _refreshToken = token;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('refresh_token', token);
  }

  static Future<void> loadRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    _refreshToken = prefs.getString('refresh_token');
  }

  static Future<String?> getRefreshToken() async {
    if (_refreshToken != null) return _refreshToken;
    final prefs = await SharedPreferences.getInstance();
    _refreshToken = prefs.getString('refresh_token');
    return _refreshToken;
  }

  static Future<void> clearRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('refresh_token');
    _refreshToken = null;
  }
}
