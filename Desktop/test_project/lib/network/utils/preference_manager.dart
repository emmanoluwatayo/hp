import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  static late SharedPreferences prefs;

  // static set isFirstLaunch(bool isFirstLaunch) =>
  //     prefs.setBool("isFirstLaunch", isFirstLaunch);
  // static bool get isFirstLaunch => prefs.getBool("isFirstLaunch") ?? true;

  // static set isLoggedIn(bool isLoggedIn) =>
  //     prefs.setBool("isLoggedIn", isLoggedIn);
  // static bool get isLoggedIn => prefs.getBool("isLoggedIn") ?? false;

  // static set profileId(String profileId) =>
  //     prefs.setString("profileId", profileId);
  // static String get profileId => prefs.getString("profileId") ?? '';

  static set authToken(String authToken) =>
      prefs.setString("authToken", authToken);
  static String get authToken => prefs.getString("authToken") ?? '';

  // static set userAvatarUrl(String userAvatarUrl) =>
  //     prefs.setString("userAvatarUrl", userAvatarUrl);
  // static String get userAvatarUrl => prefs.getString("userAvatarUrl") ?? '';

  // static set userAvatar(String userAvatar) =>
  //     prefs.setString("userAvatar", userAvatar);
  // static String get userAvatar => prefs.getString("userAvatar") ?? '';

  // static set userPhone(String userPhone) =>
  //     prefs.setString("userPhone", userPhone);
  // static String get userPhone => prefs.getString("userPhone") ?? '';

  // static set userId(String userId) => prefs.setString("userId", userId);
  // static String get userId => prefs.getString("userId") ?? '';
  // static set deviceId(String deviceId) => prefs.setString("deviceId", deviceId);
  // static String get deviceId => prefs.getString("deviceId") ?? '';
  // static set subscriptionId(String subscriptionId) =>
  //     prefs.setString("subscriptionId", subscriptionId);
  // static String get subscriptionId => prefs.getString("subscriptionId") ?? '';

  // static set userEmail(String userEmail) =>
  //     prefs.setString("userEmail", userEmail);
  // static String get userEmail => prefs.getString("userEmail") ?? '';

  // static set deviceName(String deviceName) =>
  //     prefs.setString("deviceName", deviceName);
  // static String get deviceName => prefs.getString("deviceName") ?? '';

  // static set deviceOS(String deviceOS) => prefs.setString("deviceOS", deviceOS);
  // static String get deviceOS => prefs.getString("deviceOS") ?? '';

  // static set portalBaseURL(String portalBaseURL) =>
  //     prefs.setString("portalBaseURL", portalBaseURL);
  // static String get portalBaseURL => prefs.getString("portalBaseURL") ?? '';

  static void clear() {
    prefs.clear();
    // PreferenceManager.isFirstLaunch = false;
    // PreferenceManager.authToken = "";
    // PreferenceManager.deviceId = "";
  }

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }
}
