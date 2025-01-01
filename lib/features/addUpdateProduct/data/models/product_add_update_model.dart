// ignore_for_file: public_member_api_docs, sort_constructors_first
class AddUpdateProductModel {
  final int? productId;
  final String? barkod;
  final String? productName;
  final String? productGrup;
  final String? aciklama;
  final double? alisFiyati;
  final double? satisFiyati;
  final int? kdvOrani;
  final double? kdvTutari;
  final String? birim;
  final double? miktar;
  final DateTime? tarih;
  final String? kullanici;

  AddUpdateProductModel({
    this.productId,
    this.barkod,
    this.productName,
    this.productGrup,
    this.aciklama,
    this.alisFiyati,
    this.satisFiyati,
    this.kdvOrani,
    this.kdvTutari,
    this.birim,
    this.miktar,
    this.tarih,
    this.kullanici,
  });

  // API'den alınan JSON verisini nesneye dönüştürür
  factory AddUpdateProductModel.fromJson(Map<String, dynamic> json) {
    return AddUpdateProductModel(
      productId: json['urunId'] as int?,
      barkod: json['barkod'] as String?,
      productName: json['urunAd'] as String?,
      productGrup: json['urunGrup'] as String?,
      aciklama: json['aciklama'] as String?,
      alisFiyati: (json['alisFiyati'] as num?)?.toDouble(),
      satisFiyati: (json['satisFiyati'] as num?)?.toDouble(),
      kdvOrani: (json['kdvOrani'] as num?)?.toInt(),
      kdvTutari: (json['kdvTutari'] as num?)?.toDouble(),
      birim: json['birim'] as String?,
      miktar: (json['miktar'] as num?)?.toDouble(),
      tarih: json['tarih'] != null ? DateTime.parse(json['tarih']) : null,
      kullanici: json['kullanici'] as String?,
    );
  }

  // Nesneyi JSON'a dönüştürür (API'ye gönderim için)
  Map<String, dynamic> toJson() {
    return {
      'barkod': barkod,
      'urunAd': productName,
      'urunGrup': productGrup,
      'aciklama': aciklama,
      'alisFiyati': alisFiyati,
      'satisFiyati': satisFiyati,
      'kdvOrani': kdvOrani,
      'kdvTutari': kdvTutari,
      'birim': birim,
      'miktar': miktar,
      'tarih': tarih?.toIso8601String(),
      'kullanici': kullanici,
    };
  }

  // Veritabanından veriyi alırken kullanılır
  factory AddUpdateProductModel.fromMap(Map<String, dynamic> map) {
    return AddUpdateProductModel(
      productId: map['urunId'] as int?,
      barkod: map['barkod'] as String?,
      productName: map['urunAd'] as String?,
      productGrup: map['urunGrup'] as String?,
      aciklama: map['aciklama'] as String?,
      alisFiyati: (map['alisFiyati'] as num?)?.toDouble(),
      satisFiyati: (map['satisFiyati'] as num?)?.toDouble(),
      kdvOrani: (map['kdvOrani'] as num?)?.toInt(),
      kdvTutari: (map['kdvTutari'] as num?)?.toDouble(),
      birim: map['birim'] as String?,
      miktar: (map['miktar'] as num?)?.toDouble(),
      tarih: map['tarih'] != null ? DateTime.parse(map['tarih']) : null,
      kullanici: map['kullanici'] as String?,
    );
  }

  // Nesneyi Map'e dönüştürür (Veritabanına ekleme/güncelleme için)
  Map<String, dynamic> toMap() {
    return {
      'urunId': productId,
      'barkod': barkod,
      'urunAd': productName,
      'urunGrup': productGrup,
      'aciklama': aciklama,
      'alisFiyati': alisFiyati,
      'satisFiyati': satisFiyati,
      'kdvOrani': kdvOrani,
      'kdvTutari': kdvTutari,
      'birim': birim,
      'miktar': miktar,
      'tarih': tarih?.toIso8601String(),
      'kullanici': kullanici,
    };
  }
}
