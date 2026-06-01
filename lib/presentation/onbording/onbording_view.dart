import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_on_clean_architecture/presentation/resourcses/assets_manager.dart';
import 'package:project_on_clean_architecture/presentation/resourcses/color_manager.dart';
import 'package:project_on_clean_architecture/presentation/resourcses/string_manager.dart';
import 'package:project_on_clean_architecture/presentation/resourcses/style_manager.dart';
import 'package:project_on_clean_architecture/presentation/resourcses/values_manger.dart';

class OnbordingView extends StatefulWidget {
  const OnbordingView({super.key});

  @override
  State<OnbordingView> createState() => _OnbordingViewState();
}

class _OnbordingViewState extends State<OnbordingView> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  late final List<SliderObject> _list = _getListData();

  int _currentPageIndex = 0;

  List<SliderObject> _getListData() => [
    SliderObject(
      AppString.onBoardingTitle1,
      AppString.onBoardingSubTitle1,
      ImageAssets.onBoardingLogo1,
    ),
    SliderObject(
      AppString.onBoardingTitle2,
      AppString.onBoardingSubTitle2,
      ImageAssets.onBoardingLogo2,
    ),
    SliderObject(
      AppString.onBoardingTitle3,
      AppString.onBoardingSubTitle3,
      ImageAssets.onBoardingLogo3,
    ),
    SliderObject(
      AppString.onBoardingTitle4,
      AppString.onBoardingSubTitle4,
      ImageAssets.onBoardingLogo4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: AppSize.s1_5,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _list.length,
        onPageChanged: (pageIndex) {
          setState(() {
            _currentPageIndex = pageIndex;
          });
        },
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _list[index].title,
                style: getBoldStyle(
                  color: ColorManager.darkGrey,
                  fontSize: AppSize.s16,
                ),
              ),
              Text(
                _list[index].subtitle,
                style: getBoldStyle(
                  color: ColorManager.lightGrey,
                  fontSize: AppSize.s14,
                ),
              ),
              SizedBox(height: AppSize.s12),
              SvgPicture.asset(ImageAssets.onBoardingLogo1),
            ],
          );
        },
      ),
    );
  }
}

class SliderObject {
  String title;
  String subtitle;
  String image;
  SliderObject(this.title, this.subtitle, this.image);
}
