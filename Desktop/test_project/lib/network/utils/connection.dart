import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectionUtils {
  static Future<bool> getActiveStatus() async {
    var result = await InternetConnectionChecker().connectionStatus;
    if (result == InternetConnectionStatus.disconnected) {
      // print(
      //     'internet is disconnected ${InternetConnectionChecker().checkInterval}"');
      return false;
    }
    return true;
  }
}
