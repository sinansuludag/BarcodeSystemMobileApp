// Menü Listesi: Burada her bir buton için veri tutuyoruz
import 'package:barcode_system_app/core/routes/route_names.dart';
import 'package:flutter/material.dart';

final List<Map<String, dynamic>> menuItems = [
  {
    'title': 'Satış Yap',
    'icon': Icons.point_of_sale_sharp,
    'route': RouteNames.makeSale
  },
  {'title': 'Ürünler', 'icon': Icons.inventory, 'route': '/products'},
  {
    'title': 'Ürün Ekle / Güncelle',
    'icon': Icons.add_circle_outline,
    'route': RouteNames.addUpdateProduct
  },
  {'title': 'Müşteriler', 'icon': Icons.people, 'route': '/customers'},
  {'title': 'Firmalar', 'icon': Icons.business, 'route': '/companies'},
  {
    'title': 'Alış Faturaları',
    'icon': Icons.receipt_long,
    'route': '/invoices'
  },
  {'title': 'Satış Raporu', 'icon': Icons.bar_chart, 'route': '/sales-report'},
  {
    'title': 'Ürünsel Rapor',
    'icon': Icons.pie_chart,
    'route': '/product-report'
  },
  {'title': 'Grupsal Rapor', 'icon': Icons.category, 'route': '/group-report'},
  {'title': 'Stok Sayımı', 'icon': Icons.storage, 'route': '/stock-count'},
  {'title': 'Gelirler', 'icon': Icons.arrow_upward, 'route': '/income'},
  {'title': 'Giderler', 'icon': Icons.arrow_downward, 'route': '/expenses'},
  {
    'title': 'Personeller',
    'icon': Icons.supervised_user_circle,
    'route': '/staff'
  },
  {
    'title': 'Ürün Grupları',
    'icon': Icons.production_quantity_limits,
    'route': '/product-groups'
  },
  {'title': 'Profil', 'icon': Icons.person, 'route': '/profile'},
];
