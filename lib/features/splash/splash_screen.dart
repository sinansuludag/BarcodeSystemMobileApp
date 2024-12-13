import 'package:barcode_system_app/core/constants/paddings/paddings.dart';
import 'package:barcode_system_app/core/constants/strings/tr_strings.dart';
import 'package:barcode_system_app/core/routes/route_names.dart';
import 'package:barcode_system_app/core/theme/color_scheme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animationLeft;
  late Animation<Offset> _animationRight;
  late Animation<Color?> _textColorAnimation1;
  late Animation<Color?> _textColorAnimation2;

  final int duration = 5;

  @override
  void initState() {
    super.initState();

    // Animation controller initialization
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    // Slide animations for text
    _animationLeft = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _animationRight = Tween<Offset>(
      begin: const Offset(1.5, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Initialize default color animations
    _textColorAnimation1 = AlwaysStoppedAnimation<Color?>(Colors.black);
    _textColorAnimation2 = AlwaysStoppedAnimation<Color?>(Colors.black);

    // Update color animations after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final colorScheme = Theme.of(context).colorScheme;
      setState(() {
        _textColorAnimation1 = ColorTween(
          begin: colorScheme.onSurface,
          end: colorScheme.onSurface.withOpacity(1),
        ).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
        );

        _textColorAnimation2 = ColorTween(
          begin: colorScheme.error,
          end: colorScheme.error.withOpacity(1),
        ).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
        );
      });

      _controller.forward();
    });

    // Navigate to the next screen after the duration
    Future.delayed(Duration(seconds: duration), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, RouteNames.onBoarding);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Hero(
      tag: "splash",
      child: Scaffold(
        backgroundColor: CustomColorScheme.lightColorScheme.secondaryText,
        body: Center(
          child: Padding(
            padding: AppPaddings.defaultPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSlideTransition(
                  textTheme,
                  _animationLeft,
                  TrStrings.splashTitleText1,
                  _textColorAnimation1.value ?? Colors.black,
                ),
                const SizedBox(width: 8),
                _buildSlideTransition(
                  textTheme,
                  _animationRight,
                  TrStrings.splashTitleText2,
                  _textColorAnimation2.value ?? Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SlideTransition _buildSlideTransition(TextTheme textTheme,
      Animation<Offset> position, String text, Color color) {
    return SlideTransition(
      position: position,
      child: Text(
        text,
        style: textTheme.headlineLarge?.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
