class UserLoginRequestModel {
  final int? id;
  final String? eposta;
  final String? password;

  // Constructor
  UserLoginRequestModel({
    this.id,
    this.eposta,
    this.password,
  });

  // fromJson: API'den alınan JSON verisini nesneye dönüştürür
  factory UserLoginRequestModel.fromJson(Map<String, dynamic> json) {
    return UserLoginRequestModel(
      id: json['id'] as int?,
      eposta: json['eposta'] as String?,
      password: json['sifre'] as String?,
    );
  }

  // toJson: Nesneyi JSON'a dönüştürür (API'ye gönderim için)
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (id != null) data['id'] = id;
    if (eposta != null) data['eposta'] = eposta;
    if (password != null) data['sifre'] = password;
    return data;
  }

  // fromMap: Veritabanından veriyi alırken kullanılır
  factory UserLoginRequestModel.fromMap(Map<String, dynamic> map) {
    return UserLoginRequestModel(
      id: map['id'] as int?, // ID'yi ekledik.
      eposta: map['email'] as String?,
      password: map['password'] as String?,
    );
  }
}
