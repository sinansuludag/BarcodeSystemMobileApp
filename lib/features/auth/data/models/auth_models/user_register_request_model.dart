class UserRegisterRequestModel {
  final String? name; // Ad
  final String? surname; // Soyad
  final String? eposta;
  final String? phone;
  final String? password;

  // Constructor
  UserRegisterRequestModel({
    this.name,
    this.surname,
    this.phone,
    this.eposta,
    this.password,
  });

  // fromJson: API'den alınan JSON verisini nesneye dönüştürür
  factory UserRegisterRequestModel.fromJson(Map<String, dynamic> json) {
    // 'adSoyad'ı 'name' ve 'surname' olarak ayırıyoruz
    String? fullName = json['adSoyad'] as String?;
    List<String> nameParts = fullName?.split(" ") ?? [];

    return UserRegisterRequestModel(
      name: nameParts.isNotEmpty ? nameParts[0] : null,
      surname: nameParts.length > 1
          ? nameParts.sublist(1).join(" ")
          : null, // Soyad birden fazla kelime olabilir
      phone: json['telefon'] as String?,
      eposta: json['eposta'] as String?,
      password: json['sifre'] as String?,
    );
  }

  // toJson: Nesneyi JSON'a dönüştürür (API'ye gönderim için)
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (name != null || surname != null) {
      data['adSoyad'] = '${name ?? ''} ${surname ?? ''}'.trim();
    }
    if (phone != null) data['telefon'] = phone;
    if (eposta != null) data['eposta'] = eposta;
    if (name != null) data['kullaniciAd'] = name;
    if (password != null) data['sifre'] = password;

    return data;
  }

  // toMap: Veritabanına kaydederken kullanılır
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {};
    if (name != null) data['name'] = name;
    if (surname != null) data['surname'] = surname;
    if (eposta != null) data['email'] = eposta;
    if (phone != null) data['phone'] = phone;
    if (password != null) data['password'] = password;

    return data;
  }

  // fromMap: Veritabanından veriyi alırken kullanılır
  factory UserRegisterRequestModel.fromMap(Map<String, dynamic> map) {
    return UserRegisterRequestModel(
      name: map['name'] as String?,
      surname: map['surname'] as String?,
      phone: map['phone'] as String?,
      eposta: map['email'] as String?,
      password: map['password'] as String?,
    );
  }
}
