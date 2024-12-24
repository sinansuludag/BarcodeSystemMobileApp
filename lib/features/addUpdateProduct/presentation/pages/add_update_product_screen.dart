import 'package:barcode_system_app/core/common_widgets/custom_app_bar.dart';
import 'package:barcode_system_app/core/common_widgets/custom_text_form_field.dart';
import 'package:barcode_system_app/core/constants/border_radius/border_radius.dart';
import 'package:barcode_system_app/core/constants/media_query_sizes/media_query_size.dart';
import 'package:barcode_system_app/core/constants/paddings/paddings.dart';
import 'package:barcode_system_app/core/extensions/build_context_extension.dart';
import 'package:barcode_system_app/core/theme/color_scheme.dart';
import 'package:flutter/material.dart';

class AddUpdateProductScreen extends StatefulWidget {
  @override
  State<AddUpdateProductScreen> createState() => _AddUpdateProductScreenState();
}

class _AddUpdateProductScreenState extends State<AddUpdateProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _barkodController = TextEditingController();
  final _productNameController = TextEditingController();
  final _salePriceController = TextEditingController();
  final _purchasePriceController = TextEditingController();
  final _profitRatioController = TextEditingController();
  final _kdvRatioController = TextEditingController();
  final _productDetailsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: customAppBarWidget(context),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  containerAboutBarcode(context),
                  SizedBox(height: MediaQuerySize(context).percent2Height),
                  informationProductImageContainer(context),
                  SizedBox(height: MediaQuerySize(context).percent2Height),
                  productBarcodeSection(context),
                  SizedBox(height: MediaQuerySize(context).percent1Height),
                  Padding(
                    padding: AppPaddings.horizontalSimetricDefaultPadding,
                    child: Container(
                      child: Column(
                        children: [
                          CustomTextFormField(
                              labelText: 'Ürün adı',
                              hintText: 'Ürün adı',
                              filled: false,
                              border: InputBorder.none,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              controller: _productNameController),
                          SizedBox(
                              height: MediaQuerySize(context).percent1Height),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                    labelText: 'Satış fiyatı',
                                    hintText: 'Satış fiyatı',
                                    filled: false,
                                    border: InputBorder.none,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    controller: _salePriceController),
                              ),
                              SizedBox(
                                  width: MediaQuerySize(context).percent1Width),
                              Expanded(
                                child: CustomTextFormField(
                                    labelText: 'Alış fiyatı',
                                    hintText: 'Alış fiyatı',
                                    border: InputBorder.none,
                                    filled: false,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    controller: _purchasePriceController),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: MediaQuerySize(context).percent1Height),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                    labelText: 'Kâr oranı',
                                    hintText: 'kâr oranı',
                                    filled: false,
                                    border: InputBorder.none,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    controller: _profitRatioController),
                              ),
                              SizedBox(
                                  width: MediaQuerySize(context).percent1Width),
                              Expanded(
                                child: CustomTextFormField(
                                    labelText: 'KDV (%)',
                                    hintText: 'KDV (%)',
                                    border: InputBorder.none,
                                    filled: false,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    controller: _kdvRatioController),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: MediaQuerySize(context).percent1Height),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      // Stok azalt
                                    },
                                    icon: Icon(Icons.remove_circle,
                                        color: context.colorScheme.error),
                                  ),
                                  Text('Stok'),
                                  IconButton(
                                    onPressed: () {
                                      // Stok artır
                                    },
                                    icon: Icon(Icons.add_circle,
                                        color: CustomColorScheme
                                            .lightColorScheme.success),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: AppPaddings
                                    .horizontalSimetricDefaultPadding,
                                child: DropdownButton<String>(
                                  value: 'Grupsuz ürün',
                                  items: ['Grupsuz ürün', 'Grup 1', 'Grup 2']
                                      .map((e) => DropdownMenuItem(
                                          value: e, child: Text(e)))
                                      .toList(),
                                  onChanged: (value) {
                                    // Dropdown işlevi
                                  },
                                  elevation: 4,
                                  menuMaxHeight:
                                      MediaQuerySize(context).percent50Height,
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                  dropdownColor: context.colorScheme.secondary,
                                  borderRadius:
                                      AppBorderRadius.normalBorderRadius,
                                  menuWidth:
                                      MediaQuerySize(context).percent35Width,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: MediaQuerySize(context).percent1Height),
                          CustomTextFormField(
                              labelText: 'Ürün detayı',
                              hintText: 'Ürün detayı',
                              maxLines: 3,
                              filled: false,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.none,
                              controller: _productDetailsController),
                          SizedBox(
                              height: MediaQuerySize(context).percent2Height),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  // Sil işlevi
                                },
                                icon: Icon(Icons.delete,
                                    color: context.colorScheme.onPrimary),
                                label: Text(
                                  'Sil',
                                  style: context.textTheme.bodyMedium?.copyWith(
                                      color: context.colorScheme.onPrimary),
                                ),
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: context.colorScheme.error,
                                  elevation: 4,
                                ),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  // Kaydet işlevi
                                },
                                icon: Icon(Icons.save,
                                    color: context.colorScheme.onPrimary),
                                label: Text(
                                  'Kaydet',
                                  style: context.textTheme.bodyMedium?.copyWith(
                                      color: context.colorScheme.onPrimary),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: CustomColorScheme
                                      .lightColorScheme.success,
                                  elevation: 4,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: MediaQuerySize(context).percent10Height),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuerySize(context).percent5Height,
            right: MediaQuerySize(context).percent5Width,
            child: SizedBox(
              height: MediaQuerySize(context).percent6Height,
              width: MediaQuerySize(context).percent15Height,
              child: ElevatedButton.icon(
                onPressed: () {},
                label: Text('Tara',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.onPrimary,
                    )),
                icon: Icon(
                  Icons.qr_code_scanner,
                  color: context.colorScheme.onPrimary,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colorScheme.primary,
                  elevation: 4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget productBarcodeSection(BuildContext context) {
    return Padding(
      padding: AppPaddings.horizontalSimetricDefaultPadding,
      child: Row(
        children: [
          Text(
            "Ürün barkodu :",
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),
          Text(
            " 12458789564",
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Center informationProductImageContainer(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Ürün Bilgisi',
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(height: MediaQuerySize(context).percent1Height),
          bodyTextRich(context),
          SizedBox(height: MediaQuerySize(context).percent2Height),
          Icon(Icons.image,
              size: MediaQuerySize(context).percent12Height,
              color: context.colorScheme.onSecondary),
        ],
      ),
    );
  }

  Text bodyTextRich(BuildContext context) {
    return Text.rich(
      TextSpan(
        text:
            'Eklemek / görüntülemek istediğiniz ürünün barkodunu okutun veya elle girerek ',
        style: context.textTheme.bodyMedium?.copyWith(
          color: context.colorScheme.onSecondary,
        ),
        children: [
          TextSpan(
            text: 'Getir', // Sadece "Getir" kelimesi
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.error, // Kırmızı renk
              fontWeight: FontWeight.bold, // İsteğe bağlı kalın yazı
            ),
          ),
          TextSpan(
            text: ' butonuna tıklayın.',
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSecondary,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  Container containerAboutBarcode(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuerySize(context).percent10Height,
      color: context.colorScheme.onPrimary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          barkodCustomTextFormField(),
          bringBarcodeButton(context),
          //SizedBox(width: 8),
          produceNewBarcode(context),
        ],
      ),
    );
  }

  SizedBox produceNewBarcode(BuildContext context) {
    return SizedBox(
      width: MediaQuerySize(context).percent35Width,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          'Yeni barkod',
          maxLines: 1,
          style: context.textTheme.bodyMedium
              ?.copyWith(color: context.colorScheme.onPrimary),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: context.colorScheme.onSecondary,
          elevation: 4,
        ),
      ),
    );
  }

  SizedBox bringBarcodeButton(BuildContext context) {
    return SizedBox(
      width: MediaQuerySize(context).percent25Width,
      child: ElevatedButton.icon(
        onPressed: () {
          // Getir butonu işlevi
        },
        icon: Icon(
          Icons.search,
          color: context.colorScheme.onPrimary,
        ),
        label: Text(
          'Getir',
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onPrimary,
          ),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: context.colorScheme.primary, // Arka plan rengi
            elevation: 4

            // Metin ve ikon rengi
            ),
      ),
    );
  }

  Widget barkodCustomTextFormField() {
    return SizedBox(
      width: MediaQuerySize(context).percent35Width,
      child: Padding(
        padding: AppPaddings.onlyBottomLowPadding,
        child: CustomTextFormField(
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: AppBorderRadius.highBorderRadius,
          ),
          labelText: "Ürün barkodu",
          hintText: "Ürün barkodu",
          filled: false,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          controller: _barkodController,
        ),
      ),
    );
  }

  AppBar customAppBarWidget(BuildContext context) {
    return customAppBar(
      context: context,
      title: 'Ürün Ekle / Güncelle',
      actions: [
        IconButton(
          icon: Icon(Icons.camera_alt),
          onPressed: () {
            // Kamera işlevi
          },
        ),
      ],
    );
  }
}
