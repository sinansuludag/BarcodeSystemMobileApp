import 'package:barcode_system_app/core/constants/paddings/paddings.dart';
import 'package:barcode_system_app/core/extensions/build_context_extension.dart';
import 'package:barcode_system_app/features/addUpdateProduct/presentation/state_management/provider/all_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductGroupDropdownWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Grup listesini sağlayıcıdan alıyoruz
    final groupList = ref.watch(productGroupProvider);
    final selectedGroup = ref.watch(selectedGroupProvider);

    return Padding(
      padding: AppPaddings.horizontalSimetricDefaultPadding,
      child: DropdownButton<String>(
        // Eğer seçili grup yoksa veya geçersizse varsayılan bir değer atıyoruz
        value: groupList.contains(selectedGroup) ? selectedGroup : null,
        items: groupList
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: (value) {
          if (value != null) {
            ref.read(selectedGroupProvider.notifier).state = value;
          }
        },
        elevation: 4,
        style: context.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
        dropdownColor: context.colorScheme.secondary,
      ),
    );
  }
}
