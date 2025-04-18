import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/page/splash/slide_overlay_screen.dart';
import 'package:recipe_app/presentation/page/splash/splash_view_model.dart';

class SplashScreen extends StatelessWidget {
  final SplashViewModel splashViewModel;

  const SplashScreen({super.key, required this.splashViewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: splashViewModel,
      builder: (context, child) {
        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              AnimatedOpacity(
                opacity: splashViewModel.isBackGroundVisible ? 1.0 : 0.0,
                duration: Duration(seconds: 2),
                child: Image.asset(
                  'assets/image/splash_background.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              SlideOverlayScreen(
                show: splashViewModel.isOverlayVisible,
                model: splashViewModel,
              ),
            ],
          ),
        );
      },
    );
  }
}
