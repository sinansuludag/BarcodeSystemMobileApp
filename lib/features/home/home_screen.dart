import 'package:barcode_system_app/core/constants/border_radius/border_radius.dart';
import 'package:barcode_system_app/core/constants/margins/margins.dart';
import 'package:barcode_system_app/core/constants/media_query_sizes/media_query_size.dart';
import 'package:barcode_system_app/core/constants/paddings/paddings.dart';
import 'package:barcode_system_app/core/constants/sizes/app_general_size.dart';
import 'package:barcode_system_app/core/constants/strings/tr_strings.dart';
import 'package:barcode_system_app/core/extensions/build_context_extension.dart';
import 'package:barcode_system_app/core/theme/color_scheme.dart';
import 'package:barcode_system_app/features/home/home_screen_item_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
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
                  style: context.textTheme.headlineSmall,
                ),
                Text(
                  "Yönetici",
                  style: context.textTheme.bodyMedium
                      ?.copyWith(color: context.colorScheme.onSecondary),
                ),
                SizedBox(height: MediaQuerySize(context).percent3Height),
                ListView.builder(
                  itemCount: menuItems.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = menuItems[index];
                    return containerListTiles(item, context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container containerListTiles(
      Map<String, dynamic> item, BuildContext context) {
    return Container(
      margin: AppMargins.verticalSimetricVeryLowMargins,
      decoration: BoxDecoration(
        color: context.colorScheme.onPrimary,
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
        color:
            context.colorScheme.onPrimary, // Arkaplan rengini şeffaf tutuyoruz
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
            leading: Icon(item['icon'], color: context.colorScheme.primary),
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

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: appBarTitle(context),
      scrolledUnderElevation: 0, // Kaydırma sırasında gölgeyi kaldırır
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.exit_to_app_outlined)),
      ],
    );
  }

  Row appBarTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          TrStrings.smallSplashTitleText1,
          style: context.textTheme.titleLarge
              ?.copyWith(color: context.colorScheme.onSurface),
        ),
        SizedBox(
          width: MediaQuerySize(context).percent2Width,
        ),
        Text(
          TrStrings.splashTitleText2,
          style: context.textTheme.titleLarge
              ?.copyWith(color: context.colorScheme.error),
        ),
      ],
    );
  }
}
