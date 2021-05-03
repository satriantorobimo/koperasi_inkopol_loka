class UrlString {
  final _baseUrl = 'http://api.inkoppol.com/';

  static Map<String, String> headerType = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  Map<String, String> getHeaderType() {
    return headerType;
  }

  static Map<String, String> headerTypeWithToken(String _token) => {
        'Authorization': 'Bearer $_token',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      };

  Map<String, String> getHeaderTypeWithToken(String _token) {
    return headerTypeWithToken(_token);
  }

  static String urlLogin() => 'v1/login';

  String getUrlLogin() {
    final String urlLogin2 = urlLogin();
    return _baseUrl + urlLogin2;
  }

  static String urlLogout() => 'v1/logout';

  String getUrlLogout() {
    final String urlLogout2 = urlLogout();
    return _baseUrl + urlLogout2;
  }

  static String urlProfile() => 'v1/profile';

  String getUrlProfile() {
    final String urlProfile2 = urlProfile();
    return _baseUrl + urlProfile2;
  }

  static String urlBanners() => 'v1/banners';

  String getUrlBanners() {
    final String urlBanners2 = urlBanners();
    return _baseUrl + urlBanners2;
  }

  static String urlNews() => 'v1/news';

  String getUrlNews() {
    final String urlNews2 = urlNews();
    return _baseUrl + urlNews2;
  }
}
