import 'package:barcode_system_app/core/constants/border_radius/border_radius.dart';
import 'package:barcode_system_app/core/constants/margins/margins.dart';
import 'package:barcode_system_app/core/constants/media_query_sizes/media_query_size.dart';
import 'package:barcode_system_app/core/constants/paddings/paddings.dart';
import 'package:barcode_system_app/core/constants/sizes/app_general_size.dart';
import 'package:barcode_system_app/core/theme/color_scheme.dart';
import 'package:barcode_system_app/features/home/home_screen_item_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: appBar(textTheme),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior()
            .copyWith(overscroll: false), // Glow efektini kaldırır
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPaddings.allDefaultPadding,
            child: Column(
              children: [
                // Kullanıcı Bilgisi
                SizedBox(height: MediaQuerySize(context).percent2Height),
                Text(
                  "Suludağ YAZILIM",
                  style: textTheme.headlineSmall,
                ),
                Text(
                  "Yönetici",
                  style: textTheme.bodyMedium
                      ?.copyWith(color: colorScheme.onSecondary.withAlpha(200)),
                ),
                SizedBox(height: MediaQuerySize(context).percent3Height),
                ListView.builder(
                  itemCount: menuItems.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = menuItems[index];
                    return containerListTiles(colorScheme, item, context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container containerListTiles(ColorScheme colorScheme,
      Map<String, dynamic> item, BuildContext context) {
    return Container(
      margin: AppMargins.verticalSimetricVeryLowMargins,
      decoration: BoxDecoration(
        color: colorScheme.onPrimary,
        borderRadius: AppBorderRadius.normalBorderRadius, // Yuvarlak köşeler
        boxShadow: [
          BoxShadow(
            color: CustomColorScheme.lightColorScheme.borders.withAlpha(200),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: colorScheme.onPrimary, // Arkaplan rengini şeffaf tutuyoruz
        borderRadius: AppBorderRadius
            .normalBorderRadius, // Ripple efektini yuvarlak yapar
        child: InkWell(
          borderRadius: AppBorderRadius
              .normalBorderRadius, // Dokunma efekti yuvarlak olsun
          onTap: () {
            print("${item['title']} tıklandı.");
            Navigator.pushNamed(context, item['route']);
          },
          child: ListTile(
            leading: Icon(item['icon'], color: colorScheme.primary),
            title: Text(item['title']),
            trailing: const Icon(Icons.arrow_forward_ios,
                size: AppGeneralSize.homeScreenListTileTrailing),
          ),
        ),
      ),
    );
  }

  ListTile listTile(Map<String, dynamic> item, ColorScheme colorScheme) {
    return ListTile(
      leading: Icon(item['icon'], color: colorScheme.primary),
      title: Text(item['title']),
      trailing: const Icon(Icons.arrow_forward_ios,
          size: AppGeneralSize.homeScreenListTileTrailing),
      onTap: () {
        // Burada tıklama aksiyonu eklenir
        print("${item['title']} tıklandı.");
      },
    );
  }

  AppBar appBar(TextTheme textTheme) {
    return AppBar(
      title: appBarTitle(textTheme),
      scrolledUnderElevation: 0, // Kaydırma sırasında gölgeyi kaldırır
      automaticallyImplyLeading: false,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app_outlined)),
      ],
    );
  }

  Row appBarTitle(TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Sulscan ",
          style: textTheme.titleLarge?.copyWith(color: Colors.black),
        ),
        Text(
          "PRO",
          style: textTheme.titleLarge?.copyWith(color: Colors.red),
        ),
      ],
    );
  }
}
