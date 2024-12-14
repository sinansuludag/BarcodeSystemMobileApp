import 'package:barcode_system_app/core/constants/media_query_sizes/media_query_size.dart';
import 'package:barcode_system_app/core/constants/paddings/paddings.dart';
import 'package:barcode_system_app/core/constants/sizes/app_general_size.dart';
import 'package:barcode_system_app/core/constants/sizes/app_icon_size.dart';
import 'package:barcode_system_app/core/constants/strings/tr_strings.dart';
import 'package:barcode_system_app/core/extensions/assets_path_extension.dart';
import 'package:barcode_system_app/core/routes/route_names.dart';
import 'package:barcode_system_app/features/on_boarding/model/on_boarding_source.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Column(
        children: [
          pageViewBuilder(context),
          // Sayfa göstergesi (noktalar)
          smoothPageIndicator(context),
          SizedBox(height: MediaQuerySize(context).percent3Height),
          elevatedButton(context, colorScheme),
          SizedBox(height: MediaQuerySize(context).percent3Height),
        ],
      ),
    );
  }

  Widget elevatedButton(BuildContext context, ColorScheme colorScheme) {
    return Padding(
      padding: AppPaddings.horizontalSimetricDefaultPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, RouteNames.login);
            },
            child: Text(TrStrings.skip),
            style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.secondary,
                foregroundColor: colorScheme.primary),
          ),
          iconButton(context, colorScheme),
        ],
      ),
    );
  }

  SmoothPageIndicator smoothPageIndicator(BuildContext context) {
    return SmoothPageIndicator(
      controller: _pageController,
      count: onboardingPages.length,
      effect: ExpandingDotsEffect(
        dotHeight: AppGeneralSize.dotHeight,
        dotWidth: AppGeneralSize.dotWidth,
        activeDotColor: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget iconButton(BuildContext context, ColorScheme colorScheme) {
    return IconButton(
      onPressed: () {
        if (_currentPage == onboardingPages.length - 1) {
          Navigator.pushReplacementNamed(context, RouteNames.login);
        } else {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      icon: CircleAvatar(
        backgroundColor: colorScheme.primary,
        child: Icon(
          Icons.chevron_right,
          size: AppIconSize.onBoardingNextButton,
          color: colorScheme.secondary,
        ),
      ),
      color: Theme.of(context).primaryColor,
    );
  }

  Widget pageViewBuilder(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: _pageController,
        itemCount: onboardingPages.length,
        onPageChanged: _onPageChanged,
        itemBuilder: (context, index) {
          final page = onboardingPages[index];
          return Padding(
            padding: AppPaddings.allDefaultPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(page['image'] ?? 'Not found image',
                    height: MediaQuerySize(context).percent30Height),
                SizedBox(height: MediaQuerySize(context).percent3Height),
                Text(
                  page['title'] ?? '',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: MediaQuerySize(context).percent1_5Height),
                Text(
                  page['description'] ?? '',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
