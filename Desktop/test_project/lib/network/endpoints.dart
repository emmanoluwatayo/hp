class Endpoints {
  Endpoints._();

  static const String baseURL = 'https://core.development.4traderx.com';
  static const authToken = "";

  ///TIMEOUT
  static const int receiveTimeout = 100000;
  static const int connectionTimeout = 100000;

  ///USER AUTH/ACCOUNT
  static const String users = '/login';
}
