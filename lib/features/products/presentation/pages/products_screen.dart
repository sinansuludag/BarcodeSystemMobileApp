import 'package:barcode_system_app/core/constants/border_radius/border_radius.dart';
import 'package:barcode_system_app/core/constants/media_query_sizes/media_query_size.dart';
import 'package:barcode_system_app/core/constants/paddings/paddings.dart';
import 'package:barcode_system_app/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(
        title: const Text('Ürünler'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.bar_chart_rounded),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.group_work),
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: AppPaddings.horizontalSimetricLowPadding,
          child: Column(
            children: [
              // Yatay kaydırılabilir butonlar
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterButton1('Tüm ürünler', context),
                    _buildFilterButton1('Stoktaki̇ler', context),
                    _buildFilterButton1('Stokta olmayanlar', context),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterButton2('Barkod artan', context),
                    _buildFilterButton2('Barkod azalan', context),
                    _buildFilterButton2('Ürün adı artan', context),
                  ],
                ),
              ),
              SizedBox(height: MediaQuerySize(context).percent1Height),
              Container(
                height: MediaQuerySize(context).percent5Height,
                decoration: BoxDecoration(
                  color:
                      context.colorScheme.onError, // Başlığın arka plan rengi
                  borderRadius:
                      AppBorderRadius.lowBorderRadius, // Köşe yuvarlatma
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12), // İç boşluk
                child: DropdownButton<String>(
                  value: 'Grupsuz ürün', // Başlık için varsayılan değer
                  items: ['Grupsuz ürün', 'Grup 1', 'Grup 2']
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    // Dropdown işlevi
                  },
                  menuMaxHeight: MediaQuerySize(context).percent50Height,

                  elevation: 4,
                  alignment: Alignment.center,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  dropdownColor: context.colorScheme.surface,
                  borderRadius: AppBorderRadius.normalBorderRadius,
                  menuWidth: MediaQuerySize(context).percent70Width,
                  isExpanded: true, // Genişlet
                  underline: Container(), // Alt çizgiyi kaldır
                  icon: const Icon(Icons.arrow_drop_down), // Sağ üstte ikon
                ),
              ),
              SizedBox(height: MediaQuerySize(context).percent1Height),
              Expanded(
                child: ListView(
                  children: [
                    _buildProductItem(context, 'Ülker Metro Bar 36 Gr',
                        '8690504035909', '6.00', '7.00', '10.00', false),
                    _buildProductItem(context, 'Ülker Çizi Kraker 70 Gr',
                        '8690504035909', '4.00', '5.00', '7.00', false),
                    _buildProductItem(context, 'Badempınarı Yeni 0.5 L',
                        '8690504035909', '1.00', '4.00', '6.00', true),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterButton1(String text, BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colorScheme.primary,
      ),
      child: Text(
        text,
        style: context.textTheme.bodyMedium
            ?.copyWith(color: context.colorScheme.onPrimary),
      ),
    );
  }

  Widget _buildFilterButton2(String text, BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colorScheme.secondary,
      ),
      child: Text(
        text,
        style: context.textTheme.bodyMedium
            ?.copyWith(color: context.colorScheme.onSecondary),
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, String name, String barcode,
      String stock, String purchase, String price, bool isLowStock) {
    return Card(
      color: context.colorScheme.secondary,
      child: ListTile(
        leading: Icon(
          Icons.error,
          color: context.colorScheme.onSecondary,
        ),
        title: Text(
          name,
          style: context.textTheme.bodyLarge
              ?.copyWith(color: context.colorScheme.onSurface),
        ),
        subtitle: Text(barcode,
            style: context.textTheme.bodyMedium
                ?.copyWith(color: context.colorScheme.onSecondary)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              stock,
              style: isLowStock
                  ? TextStyle(color: context.colorScheme.error)
                  : TextStyle(color: context.colorScheme.primary),
            ),
            const SizedBox(width: 8),
            Text(
              purchase,
              style: const TextStyle(color: Colors.green),
            ),
            const SizedBox(width: 8),
            Text(
              price,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
