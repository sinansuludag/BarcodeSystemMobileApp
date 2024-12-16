import 'package:barcode_system_app/core/constants/media_query_sizes/media_query_size.dart';
import 'package:barcode_system_app/core/constants/paddings/paddings.dart';
import 'package:barcode_system_app/core/constants/strings/tr_strings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: appBarTitle(textTheme, colorScheme, context),
          actions: [appBarExitButton()],
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: AppPaddings.horizontalSimetricDefaultPadding,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuerySize(context).percent5Height,
              ),
              userNameText(textTheme, colorScheme),
            ],
          ),
        )));
  }

  Center userNameText(TextTheme textTheme, ColorScheme colorScheme) {
    return Center(
      child: Text(
        "Sinan Suludağ",
        style: textTheme.headlineSmall?.copyWith(
          color: colorScheme.onSecondary,
        ),
      ),
    );
  }

  IconButton appBarExitButton() =>
      IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app_outlined));

  Row appBarTitle(
      TextTheme textTheme, ColorScheme colorScheme, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          TrStrings.smallSplashTitleText1,
          style: textTheme.headlineSmall?.copyWith(
            color: colorScheme.onSecondary,
          ),
        ),
        SizedBox(
          width: MediaQuerySize(context).percent2Width,
        ),
        Text(TrStrings.splashTitleText2,
            style: textTheme.headlineSmall?.copyWith(color: colorScheme.error))
      ],
    );
  }
}
