class ApiUrls {
  // Private constructor to prevent instantiation
  ApiUrls._();

  static const String _baseURL = "http://69.62.73.166:5000";

  // Api Endpoints
  static String userLogIn = "/user/signin";
  static String createAccount = "/user/signup";
  static String sendUserNIDInfo = "/user/nid/info/";
  static String verifyUser = "/user/verify/";

  // Public getter to access the base URL
  static String get baseURL => _baseURL;
}

