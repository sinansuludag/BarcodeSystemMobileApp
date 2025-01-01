import 'package:barcode_system_app/core/constants/border_radius/border_radius.dart';
import 'package:barcode_system_app/core/constants/media_query_sizes/media_query_size.dart';
import 'package:barcode_system_app/core/constants/paddings/paddings.dart';
import 'package:barcode_system_app/core/extensions/build_context_extension.dart';
import 'package:barcode_system_app/features/addUpdateProduct/presentation/state_management/provider/all_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductUnitDropdownButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedUnit = ref.watch(selectedUnitProvider);
    final unitList = ref.watch(productUnitProvider);
    return Padding(
      padding: AppPaddings.horizontalSimetricDefaultPadding,
      child: DropdownButton<String>(
        value: selectedUnit,
        items: unitList
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: (value) {
          if (value != null) {
            ref.read(selectedUnitProvider.notifier).state = value;
          }
        },
        elevation: 4,
        menuMaxHeight: MediaQuerySize(context).percent50Height,
        style: context.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
        dropdownColor: context.colorScheme.secondary,
        borderRadius: AppBorderRadius.normalBorderRadius,
        menuWidth: MediaQuerySize(context).percent35Width,
      ),
    );
  }
}
