import 'package:barcode_system_app/core/extensions/assets_path_extension.dart';
import 'package:barcode_system_app/core/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  // Onboarding içerikleri
  final List<Map<String, String>> onboardingPages = [
    {
      'image': 'amico1'.png,
      'title': 'Hoş Geldiniz!',
      'description': 'Uygulamamızı kullanmaya başlayın.'
    },
    {
      'image': 'rafiki2'.png,
      'title': 'Kolay Kullanım',
      'description': 'Basit ve anlaşılır bir arayüz ile tasarlandı.'
    },
    {
      'image': 'bro3'.png,
      'title': 'Hemen Başlayın!',
      'description': 'Hadi, şimdi kaydolun ve başlayalım!'
    },
  ];

  int _currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Hero(
      tag: "splash",
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingPages.length,
                onPageChanged: _onPageChanged,
                itemBuilder: (context, index) {
                  final page = onboardingPages[index];
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(page['image']!, height: 300),
                        const SizedBox(height: 24),
                        Text(
                          page['title']!,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          page['description']!,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Sayfa göstergesi (noktalar)
            SmoothPageIndicator(
              controller: _pageController,
              count: onboardingPages.length,
              effect: ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 24),
            // Skip ve Next butonları
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Skip butonu
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, RouteNames.login);
                    },
                    child: Text("Atla"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.secondary,
                        foregroundColor: colorScheme.primary),
                  ),
                  // Next butonu (sağ ok ikonu)
                  IconButton(
                    onPressed: () {
                      if (_currentPage == onboardingPages.length - 1) {
                        // Son sayfa: Başlangıç ekranına yönlendirme
                        Navigator.pushReplacementNamed(
                            context, RouteNames.login);
                      } else {
                        // Sonraki sayfaya geçiş
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
                        size: 30,
                        color: colorScheme.secondary,
                      ),
                    ),
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
