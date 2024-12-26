class UserLoginRequestModel {
  final String? eposta;
  final String? password;

  // Constructor
  UserLoginRequestModel({
    this.eposta,
    this.password,
  });

  // fromJson: API'den alınan JSON verisini nesneye dönüştürür
  factory UserLoginRequestModel.fromJson(Map<String, dynamic> json) {
    return UserLoginRequestModel(
      eposta: json['eposta'] as String?,
      password: json['sifre'] as String?,
    );
  }

  // toJson: Nesneyi JSON'a dönüştürür (API'ye gönderim için)
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (eposta != null) data['eposta'] = eposta;
    if (password != null) data['sifre'] = password;
    return data;
  }

  // toMap: Veritabanına kaydederken kullanılır
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {};
    if (eposta != null) data['email'] = eposta;
    if (password != null) data['password'] = password;
    return data;
  }

  // fromMap: Veritabanından veriyi alırken kullanılır
  factory UserLoginRequestModel.fromMap(Map<String, dynamic> map) {
    return UserLoginRequestModel(
      eposta: map['email'] as String?,
      password: map['password'] as String?,
    );
  }
}
