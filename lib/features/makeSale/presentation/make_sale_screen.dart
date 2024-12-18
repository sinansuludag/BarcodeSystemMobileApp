import 'package:barcode_system_app/core/constants/colors/color_darken.dart';
import 'package:barcode_system_app/features/makeSale/data/satis_list.dart';
import 'package:flutter/material.dart';
import 'package:barcode_system_app/common_widgets/custom_text_form_field.dart';
import 'package:barcode_system_app/core/constants/border_radius/border_radius.dart';
import 'package:barcode_system_app/core/constants/media_query_sizes/media_query_size.dart';
import 'package:barcode_system_app/core/constants/paddings/paddings.dart';
import 'package:barcode_system_app/core/theme/color_scheme.dart';

class MakeSaleScreen extends StatefulWidget {
  const MakeSaleScreen({super.key});

  @override
  State<MakeSaleScreen> createState() => _MakeSaleScreenState();
}

class _MakeSaleScreenState extends State<MakeSaleScreen> {
  final formKey = GlobalKey<FormState>();
  final barcodController = TextEditingController();
  final salesNoteController = TextEditingController();

  double get totalQuantity =>
      purchasedProducts.fold(0, (sum, item) => sum + item['quantity']);
  double get grossTotal => purchasedProducts.fold(
        0,
        (sum, item) => sum + (item['quantity'] * item['unitPrice']),
      );
  double get discount => 0.0; // Placeholder for discount logic
  double get total => grossTotal - discount;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: appBar(colorScheme, textTheme),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: AppPaddings.horizontalSimetricDefaultPadding,
              child: Column(
                children: [
                  Container(
                    padding: AppPaddings.allLowPadding,
                    child: topInformationRow(colorScheme),
                  ),
                  readingBarcodeRow(context, colorScheme),
                  salesListViewBuilder(context, colorScheme, textTheme),
                  Container(
                    padding: AppPaddings.allLowPadding,
                    child: Column(
                      children: [
                        customSaleInformation(colorScheme, textTheme),
                        SizedBox(
                          height: MediaQuerySize(context).percent1Height,
                        ),
                        customSaleNoteTextFormField(),
                        saleDetailsAndIadeModeCheckBox(),
                      ],
                    ),
                  ),
                  choosePurchaseMethod(colorScheme, textTheme),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget choosePurchaseMethod(ColorScheme colorScheme, TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildPaymentButton("Nakit", colorScheme, textTheme),
        buildPaymentButton("Pos", colorScheme, textTheme),
        buildPaymentButton("Açık Hesap", colorScheme, textTheme),
        buildPaymentButton("Parçalı", colorScheme, textTheme),
      ],
    );
  }

  Widget saleDetailsAndIadeModeCheckBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(value: true, onChanged: (value) {}),
        const Text("Fiyat detayını gör"),
        const Spacer(),
        Checkbox(value: false, onChanged: (value) {}),
        const Text("İade modu"),
      ],
    );
  }

  CustomTextFormField customSaleNoteTextFormField() {
    return CustomTextFormField(
      border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: AppBorderRadius.highBorderRadius),
      labelText: "Satış notu",
      hintText: "Satış notu",
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      controller: salesNoteController,
    );
  }

  Container customSaleInformation(
      ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: CustomColorScheme.lightColorScheme.borders),
          borderRadius: AppBorderRadius.highBorderRadius),
      child: InkWell(
        onTap: () {},
        borderRadius: AppBorderRadius.highBorderRadius,
        child: ListTile(
          leading: const Icon(Icons.person_outline),
          title: Text(
            "Müşterisiz satış",
            style: textTheme.bodyLarge?.copyWith(
              color: darkenColor(colorScheme.onSurface, 1),
            ),
          ),
          subtitle: Text("Borç: 0.00"),
          trailing: Icon(Icons.person_add),
        ),
      ),
    );
  }

  Container salesListViewBuilder(
      BuildContext context, ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      height: MediaQuerySize(context).percent30Height,
      child: ListView.builder(
        itemCount: purchasedProducts.length,
        itemBuilder: (context, index) {
          final product = purchasedProducts[index];
          return buildProductTile(
              product['name'],
              product['barcode'],
              product['quantity'],
              product['unitPrice'],
              product['quantity'] * product['unitPrice'],
              colorScheme,
              textTheme);
        },
      ),
    );
  }

  Widget readingBarcodeRow(BuildContext context, ColorScheme colorScheme) {
    return Padding(
      padding: AppPaddings.onlyBottomLowPadding,
      child: Row(
        children: [
          Expanded(
            child: customBarkodTextFormField(),
          ),
          SizedBox(width: MediaQuerySize(context).percent1Width),
          elevatedButton(colorScheme, context),
        ],
      ),
    );
  }

  CustomTextFormField customBarkodTextFormField() {
    return CustomTextFormField(
        prefixIcon: const Icon(Icons.search),
        labelText: "Ürün barkodunu okutunuz",
        hintText: "Ürün barkodunu okutunuz",
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        controller: barcodController);
  }

  ElevatedButton elevatedButton(ColorScheme colorScheme, BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        padding: AppPaddings.allDefaultPadding,
      ),
      child: Row(
        children: [
          Icon(
            Icons.qr_code_scanner,
            color: colorScheme.onPrimary,
          ),
          SizedBox(
            width: MediaQuerySize(context).percent2Width,
          ),
          Text("Tara", style: TextStyle(color: colorScheme.onError)),
        ],
      ),
    );
  }

  Row topInformationRow(ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              "Miktar",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: darkenColor(colorScheme.onSurface, 0.2),
              ),
            ),
            Text(totalQuantity.toStringAsFixed(2)),
          ],
        ),
        Column(
          children: [
            Text("Brüt",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: darkenColor(colorScheme.onSurface, 0.2),
                )),
            Text(grossTotal.toStringAsFixed(2)),
          ],
        ),
        Column(
          children: [
            Text(
              "İskonto",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: darkenColor(colorScheme.onSurface, 0.2)),
            ),
            Text(discount.toStringAsFixed(2)),
          ],
        ),
        Column(
          children: [
            Text(
              "Tutar",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: darkenColor(colorScheme.onSurface, 0.2)),
            ),
            Text(
              total.toStringAsFixed(2),
            ),
          ],
        ),
      ],
    );
  }

  AppBar appBar(ColorScheme colorScheme, TextTheme textTheme) {
    return AppBar(
      title: Padding(
        padding: AppPaddings.onlyRightDefaultPadding,
        child: Text(
          "Satış Yap",
          style: textTheme.headlineSmall,
        ),
      ),
      centerTitle: true,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: colorScheme.onSurface),
      actions: [
        const Icon(Icons.percent),
        SizedBox(width: MediaQuerySize(context).percent3Width),
        const Icon(Icons.add),
        SizedBox(width: MediaQuerySize(context).percent3Width),
        const Icon(Icons.videogame_asset_sharp),
        SizedBox(width: MediaQuerySize(context).percent3Width),
        const Padding(
          padding: AppPaddings.onlyRightDefaultPadding,
          child: Icon(Icons.print),
        ),
      ],
    );
  }

  Widget buildProductTile(
      String name,
      String barcode,
      int quantity,
      double unitPrice,
      double totalPrice,
      ColorScheme colorScheme,
      TextTheme textTheme) {
    return Container(
      margin: AppPaddings.verticalSimetriVeryLowPadding,
      padding: AppPaddings.allDefaultPadding,
      decoration: BoxDecoration(
        color: colorScheme.secondary,
        borderRadius: AppBorderRadius.defaultBorderRadius,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              "$quantity X",
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Ürün adı ve barkod sütunu
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  maxLines: 3, // Tek satırda göster
                  overflow:
                      TextOverflow.ellipsis, // Taşan kısmı "..." ile göster
                  textAlign: TextAlign.center,
                  style: textTheme.bodyLarge?.copyWith(
                    color: darkenColor(colorScheme.onSurface, 0.2),
                  ),
                ),
                Text(
                  barcode,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          // Fiyat bilgileri sütunu
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${totalPrice.toStringAsFixed(2)} ₺",
                  style: textTheme.bodyMedium?.copyWith(
                    color: darkenColor(colorScheme.onSurface, 0.2),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "${unitPrice.toStringAsFixed(2)} ₺",
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPaymentButton(
      String label, ColorScheme colorScheme, TextTheme textTheme) {
    return Expanded(
      child: Padding(
        padding: AppPaddings.horizontalSimetricVeryLowPadding,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            padding: AppPaddings.verticalSimetricDefaultPadding,
          ),
          child: Text(
            label,
            style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.surface, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
