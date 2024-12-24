import 'package:barcode_system_app/core/constants/paddings/paddings.dart';
import 'package:barcode_system_app/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(
    {required BuildContext context,
    required String title,
    required List<Widget> actions}) {
  return AppBar(
      title: Padding(
        padding: AppPaddings.onlyRightDefaultPadding,
        child: Text(
          title,
          style: context.textTheme.headlineSmall,
        ),
      ),
      centerTitle: true,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: context.colorScheme.onSurface),
      actions: actions);
}
