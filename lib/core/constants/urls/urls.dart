enum Urls {
  kullanici,
  urun,
}

// Base URL
const String baseUrl = "http://192.168.13.100:5009/api";

// Enum Extension
extension UrlsExtension on Urls {
  String get path {
    switch (this) {
      case Urls.kullanici:
        return "$baseUrl/Kullanici";
      case Urls.urun:
        return "$baseUrl/Urun";
    }
  }
}
