import 'package:flutter/material.dart';
import 'package:project_on_clean_architecture/presentation/details/details_view.dart';
import 'package:project_on_clean_architecture/presentation/forgot_password/forgot_password_view.dart';
import 'package:project_on_clean_architecture/presentation/login/login_view.dart';
import 'package:project_on_clean_architecture/presentation/main/main_view.dart';
import 'package:project_on_clean_architecture/presentation/onbording/onbording_view.dart';
import 'package:project_on_clean_architecture/presentation/register/register_view.dart';
import 'package:project_on_clean_architecture/presentation/splash/splash_view.dart';

class RoutesManager {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String detailsRoute = "/details";
  static const String onBordingRoute = "/onBording";
  static const String mainRoute = "/main";
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case (RoutesManager.splashRoute):
        return MaterialPageRoute(builder: (_) => SplashView());
      case (RoutesManager.loginRoute):
        return MaterialPageRoute(builder: (_) => LoginView());
      case (RoutesManager.registerRoute):
        return MaterialPageRoute(builder: (_) => RegisterView());
      case (RoutesManager.forgotPasswordRoute):
        return MaterialPageRoute(
          builder: (_) => ForgotPasswordView(),
        );
      case (RoutesManager.detailsRoute):
        return MaterialPageRoute(builder: (_) => DetailsView());
      case (RoutesManager.onBordingRoute):
        return MaterialPageRoute(builder: (_) => OnbordingView());
      case (RoutesManager.mainRoute):
        return MaterialPageRoute(builder: (_) => MainView());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text("invalid Route")),
          body: Center(child: Text("invalid Route")),
        );
      },
    );
  }
}
