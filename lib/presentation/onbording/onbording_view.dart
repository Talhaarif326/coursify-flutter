import 'package:flutter/material.dart';
import 'package:project_on_clean_architecture/presentation/resourcses/color_manager.dart';

class OnbordingView extends StatefulWidget {
  const OnbordingView({super.key});

  @override
  State<OnbordingView> createState() => _OnbordingViewState();
}

class _OnbordingViewState extends State<OnbordingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(child: Text('Welcome on board')),
    );
  }
}
