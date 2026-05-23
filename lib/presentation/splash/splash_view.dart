import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_on_clean_architecture/presentation/resourcses/assets_manager.dart';
import 'package:project_on_clean_architecture/presentation/resourcses/color_manager.dart';
import 'package:project_on_clean_architecture/presentation/resourcses/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  void _startDelay() {
    _timer = Timer(Duration(seconds: 2), _goToNextScreen);
  }

  void _goToNextScreen() {
    Navigator.pushReplacementNamed(
      context,
      RoutesManager.onBordingRoute,
    );
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(child: SvgPicture.asset(ImageAssets.splashLogo)),
    );
  }
}
