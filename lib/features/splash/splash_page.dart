import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:netguru/features/generator/ui/pages/generator_page.dart';
import 'package:netguru/helpers/netguru_values_manager.dart';
import 'package:netguru/locator/service_locator.dart';
import 'package:netguru/resources/netguru_colors.dart';
import 'package:netguru/resources/images.dart';

final _splashLogoSize = 200.0;
final _splashMinimalDuration = Duration(seconds: 3);

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  final NetguruValuesManager _valuesManager = getIt.get();
  bool _shouldCloseSplashPage = false;
  Animation _animation;
  AnimationController controller;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _setUpAnimation();
    _setUpTimer();
    _initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: NetguruColors.background,
        child: Center(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (_, child) => Container(
              height: (_animation.value * 0.1 + 1) * _splashLogoSize,
              width: (_animation.value * 0.1 + 1) * _splashLogoSize,
              child: child,
            ),
            child: ClipOval(child: Image.asset(Images.netguru)),
          ),
        ),
      ),
    );
  }

  void _setUpAnimation() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: controller,
      curve: Curves.ease,
    ); //tween.animate(controller);
    controller.repeat(reverse: true);
  }

  void _setUpTimer() {
    _timer = Timer(_splashMinimalDuration, () {
      if (_shouldCloseSplashPage) _navigateToNextPage();
    });
  }

  void _initializeApp() async {
    await _valuesManager.init();
    _closeSplashPage();
  }

  void _closeSplashPage() {
    if (!_timer.isActive) {
      _navigateToNextPage();
    } else {
      _shouldCloseSplashPage = true;
    }
  }

  void _navigateToNextPage() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 600),
        pageBuilder: (_, __, ___) => GeneratorPage(),
        transitionsBuilder: (_, animation, ___, child) {
          return FadeTransition(
            opacity: animation.drive(Tween(begin: 0.0, end: 1.0)),
            child: child,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
