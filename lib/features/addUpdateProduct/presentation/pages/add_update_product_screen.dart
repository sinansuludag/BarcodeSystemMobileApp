import 'dart:math';

import 'package:barcode_system_app/core/common_widgets/custom_app_bar.dart';
import 'package:barcode_system_app/core/common_widgets/custom_text_form_field.dart';
import 'package:barcode_system_app/core/constants/border_radius/border_radius.dart';
import 'package:barcode_system_app/core/constants/media_query_sizes/media_query_size.dart';
import 'package:barcode_system_app/core/constants/paddings/paddings.dart';
import 'package:barcode_system_app/core/exceptions/error_handler.dart';
import 'package:barcode_system_app/core/extensions/build_context_extension.dart';
import 'package:barcode_system_app/core/extensions/snack_bar_extension.dart';
import 'package:barcode_system_app/core/mixins/app_update_product_screen_mixin.dart';
import 'package:barcode_system_app/core/routes/route_names.dart';
import 'package:barcode_system_app/core/theme/color_scheme.dart';
import 'package:barcode_system_app/features/addUpdateProduct/data/models/product_add_update_model.dart';
import 'package:barcode_system_app/features/addUpdateProduct/presentation/state_management/provider/all_product_provider.dart';
import 'package:barcode_system_app/features/addUpdateProduct/presentation/state_management/provider/product_state_manager.dart';
import 'package:barcode_system_app/features/addUpdateProduct/presentation/widgets/product_group_dropdown_button.dart';
import 'package:barcode_system_app/features/addUpdateProduct/presentation/widgets/product_unit_dropdown_button.dart';
import 'package:barcode_system_app/features/auth/presentation/state_management/provider/auth_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddUpdateProductScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<AddUpdateProductScreen> createState() =>
      _AddUpdateProductScreenState();
}

class _AddUpdateProductScreenState extends ConsumerState<AddUpdateProductScreen>
    with AppUpdateProductScreenMixin {
  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Sayfa ilk kez yüklendiğinde barkodu sıfırla
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(productBarcodeProvider.notifier).state = '';
    });
  }

  // Rastgele benzersiz barkod üretme
  String generateBarcode() {
    final Random random = Random();
    return List.generate(11, (index) => random.nextInt(10))
        .join(); // 12 haneli sayı
  }

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
                  productInputsSectionContainer(context),
                ],
              ),
            ),
          ),
          barcodeScanButtonPositioned(context),
        ],
      ),
    );
  }

  Positioned barcodeScanButtonPositioned(BuildContext context) {
    return Positioned(
      bottom: MediaQuerySize(context).percent5Height,
      right: MediaQuerySize(context).percent5Width,
      child: SizedBox(
        height: MediaQuerySize(context).percent6Height,
        width: MediaQuerySize(context).percent15Height,
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.barcodeScree);
          },
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
    );
  }

  Padding productInputsSectionContainer(BuildContext context) {
    return Padding(
      padding: AppPaddings.horizontalSimetricDefaultPadding,
      child: Container(
        child: Column(
          children: [
            productNameTextFormField(),
            SizedBox(height: MediaQuerySize(context).percent1Height),
            Row(
              children: [
                productSalePriceTextFormField(),
                SizedBox(width: MediaQuerySize(context).percent1Width),
                productSellPriceTextFormField(),
              ],
            ),
            SizedBox(height: MediaQuerySize(context).percent1Height),
            Row(
              children: [
                productKdvRaitoTextFormField(),
                SizedBox(width: MediaQuerySize(context).percent1Width),
                ProductGroupDropdownWidget(),
              ],
            ),
            SizedBox(height: MediaQuerySize(context).percent1Height),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                amountIncreaseAndDecreaseButton(context),
                ProductUnitDropdownButton(),
              ],
            ),
            SizedBox(height: MediaQuerySize(context).percent1Height),
            SizedBox(height: MediaQuerySize(context).percent1Height),
            productDetailsTextFormField(),
            SizedBox(height: MediaQuerySize(context).percent2Height),
            removeAndSaveButtonRow(context),
            SizedBox(height: MediaQuerySize(context).percent10Height),
          ],
        ),
      ),
    );
  }

  Row removeAndSaveButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            // Sil işlevi
          },
          icon: Icon(Icons.delete, color: context.colorScheme.onPrimary),
          label: Text(
            'Sil',
            style: context.textTheme.bodyMedium
                ?.copyWith(color: context.colorScheme.onPrimary),
          ),
          style: OutlinedButton.styleFrom(
            backgroundColor: context.colorScheme.error,
            elevation: 4,
          ),
        ),
        ElevatedButton.icon(
          onPressed: ref.watch(productProvider) == ProductState.loading
              ? null
              : () async {
                  try {
                    var barcode = ref.watch(productBarcodeProvider);
                    var user =
                        await ref.watch(authProvider.notifier).getCurrentUser();
                    var userName = user?.name ?? '';
                    var userSurname = user?.surname ?? '';
                    var productModel = AddUpdateProductModel(
                      barkod: barcode,
                      productName: productNameController.text,
                      satisFiyati: double.tryParse(sellPriceController.text),
                      alisFiyati: double.tryParse(purchasePriceController.text),
                      kdvOrani: int.tryParse(kdvRatioController.text),
                      productGrup: ref.watch(selectedGroupProvider),
                      birim: ref.watch(selectedUnitProvider),
                      miktar: ref.watch(productAmountProvider),
                      kullanici: '$userName $userSurname',
                      tarih: DateTime.now(),
                      kdvTutari:
                          (double.tryParse(kdvRatioController.text) ?? 0.0) *
                              (double.tryParse(amountController.text) ?? 0.0),
                      aciklama: productDetailsController.text,
                    );
                    // Auth işlemi
                    final productNotifier = ref.read(productProvider.notifier);
                    await productNotifier.addProduct(productModel);

                    // Eğer giriş başarılıysa yönlendirme yap
                    if (ref.watch(productProvider) == ProductState.success) {
                      ref.read(productBarcodeProvider.notifier).state = '';
                      productNameController.clear();
                      purchasePriceController.clear();
                      sellPriceController.clear();
                      kdvRatioController.clear();
                      productDetailsController.clear();
                      amountController.clear();
                      context
                          .showSnackBar('Ürün başarılı bir şekilde kaydedildi');
                    } else {
                      throw Exception();
                    }
                  } catch (e) {
                    print('UI sayfasına bak');
                    context.showSnackBar(
                        ErrorHandler.handleException(e).toString());
                    print(e.toString());
                  }
                },
          icon: ref.watch(productProvider) == ProductState.loading
              ? null
              : Icon(Icons.save, color: context.colorScheme.onPrimary),
          label: ref.watch(productProvider) == ProductState.loading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  'Kaydet',
                  style: context.textTheme.bodyMedium
                      ?.copyWith(color: context.colorScheme.onPrimary),
                ),
          style: ElevatedButton.styleFrom(
            backgroundColor: CustomColorScheme.lightColorScheme.success,
            elevation: 4,
          ),
        ),
      ],
    );
  }

  CustomTextFormField productDetailsTextFormField() {
    return CustomTextFormField(
        labelText: 'Ürün detayı',
        hintText: 'Ürün detayı',
        maxLines: 3,
        filled: false,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.none,
        controller: productDetailsController);
  }

  Widget amountIncreaseAndDecreaseButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            final currentAmount =
                ref.read(productAmountProvider.notifier).state;
            if (currentAmount > 0) {
              ref.read(productAmountProvider.notifier).state =
                  currentAmount - 1;
              double updateAmount = currentAmount - 1;
              amountController.text =
                  updateAmount >= 0 ? updateAmount.toString() : '0';
            } else {
              context.showSnackBar('Miktar 0\'dan küçük olamaz');
            }
          },
          icon: Icon(Icons.remove_circle, color: context.colorScheme.error),
        ),
        SizedBox(
          width: MediaQuerySize(context).percent20Width, // Genişlik belirleyin
          child: CustomTextFormField(
            labelText: 'Miktar',
            hintText: 'Miktar',
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            border: InputBorder.none,
            filled: false,
            controller: amountController,
            onChanged: (value) {
              final newValue = double.tryParse(value) ?? 0;
              if (newValue < 0) {
                context.showSnackBar('Miktar 0\'dan küçük olamaz');
                amountController.text = '0'; // Negatif değer girişini sıfırla
                ref.read(productAmountProvider.notifier).state = 0;
              } else {
                // Geçerli değeri güncelle
                ref.read(productAmountProvider.notifier).state = newValue;
              }
            },
          ),
        ),
        IconButton(
          onPressed: () {
            final currentAmount =
                ref.read(productAmountProvider.notifier).state;
            ref.read(productAmountProvider.notifier).state = currentAmount + 1;
            amountController.text = (currentAmount + 1).toString();
          },
          icon: Icon(Icons.add_circle,
              color: CustomColorScheme.lightColorScheme.success),
        ),
      ],
    );
  }

  Expanded productKdvRaitoTextFormField() {
    return Expanded(
      child: CustomTextFormField(
          labelText: 'KDV (%)',
          hintText: 'KDV (%)',
          border: InputBorder.none,
          filled: false,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          controller: kdvRatioController),
    );
  }

  Expanded productSellPriceTextFormField() {
    return Expanded(
      child: CustomTextFormField(
          labelText: 'Alış fiyatı',
          hintText: 'Alış fiyatı',
          border: InputBorder.none,
          filled: false,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          controller: sellPriceController),
    );
  }

  Widget productSalePriceTextFormField() {
    return Expanded(
      child: CustomTextFormField(
          labelText: 'Satış fiyatı',
          hintText: 'Satış fiyatı',
          filled: false,
          border: InputBorder.none,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          controller: purchasePriceController),
    );
  }

  Widget productNameTextFormField() {
    return CustomTextFormField(
        labelText: 'Ürün adı',
        hintText: 'Ürün adı',
        filled: false,
        border: InputBorder.none,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        controller: productNameController);
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
            ref.watch(productBarcodeProvider),
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
          produceNewBarcode(context),
        ],
      ),
    );
  }

  SizedBox produceNewBarcode(BuildContext context) {
    return SizedBox(
      width: MediaQuerySize(context).percent35Width,
      child: ElevatedButton(
        onPressed: () {
          ref.read(productBarcodeProvider.notifier).state = generateBarcode();
        },
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
        onPressed: () {},
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
          controller: barkodController,
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
