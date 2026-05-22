import 'package:flutter/material.dart';
import 'package:project_on_clean_architecture/presentation/resourcses/color_manager.dart';
import 'package:project_on_clean_architecture/presentation/resourcses/style_manager.dart';
import 'package:project_on_clean_architecture/presentation/resourcses/values_manger.dart';

ThemeData getThemeDate() {
  return ThemeData(
    // main Colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey,

    //Card theme Colors
    cardTheme: CardThemeData(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    // app bar theme
    appBarTheme: AppBarThemeData(
      centerTitle: true,
      backgroundColor: ColorManager.primary,
      titleTextStyle: getRegularStyle(color: ColorManager.white),
    ),

    // button theme
    buttonTheme: ButtonThemeData(
      shape: StadiumBorder(),
      buttonColor: ColorManager.primary,
      disabledColor: ColorManager.grey,
      splashColor: ColorManager.primaryOpacity70,
    ),
    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white),
        foregroundColor: ColorManager.primary,
      ),
    ),

    // text theme
    textTheme: TextTheme(
      bodyLarge: getRegularStyle(
        color: ColorManager.grey,
        fontSize: AppSize.s18,
      ),
      bodyMedium: getRegularStyle(
        color: ColorManager.grey,
        fontSize: AppSize.s14,
      ),
      bodySmall: getRegularStyle(
        color: ColorManager.grey,
        fontSize: AppSize.s12,
      ),
      headlineLarge: getBoldStyle(
        color: ColorManager.darkGrey,
        fontSize: AppSize.s18,
      ),
      headlineMedium: getBoldStyle(
        color: ColorManager.darkGrey,
        fontSize: AppSize.s16,
      ),
      headlineSmall: getBoldStyle(
        color: ColorManager.darkGrey,
        fontSize: AppSize.s12,
      ),
      titleLarge: getSemiBold(
        color: ColorManager.darkGrey,
        fontSize: AppMargin.m18,
      ),
      titleMedium: getSemiBold(
        color: ColorManager.darkGrey,
        fontSize: AppMargin.m16,
      ),
      titleSmall: getSemiBold(
        color: ColorManager.darkGrey,
        fontSize: AppMargin.m12,
      ),
    ),

    // input feild theme ( Form feilds)
    inputDecorationTheme: InputDecoration(
      contentPadding: EdgeInsets.all(AppPadding.p8),
      labelStyle: getRegularStyle(color: ColorManager.grey),
      hintStyle: getRegularStyle(color: ColorManager.grey),
      errorStyle: getRegularStyle(color: ColorManager.error),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s12),
        borderSide: BorderSide(
          color: ColorManager.darkPrimary,
          width: AppSize.s1_5,
        ),
      ),
      //focused border
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s12),
        borderSide: BorderSide(
          color: ColorManager.darkPrimary,
          width: AppSize.s1_5,
        ),
      ),

      // error border
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s12),
        borderSide: BorderSide(
          color: ColorManager.error,
          width: AppSize.s1_5,
        ),
      ),
      // normal border
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
    ),
  );
}
