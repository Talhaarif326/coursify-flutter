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
        elevation: AppSize.s1_5,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
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
          // onboarding page widget
          return OnBoardingPage(sliderObject: _list[index]);
        },
      ),
      //bottom sheet
      bottomSheet: Container(
        height: AppSize.s100,
        color: ColorManager.white,
        child: Align(
          alignment: Alignment.centerRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // skip button
              TextButton(
                onPressed: () {
                  // on Tap goes to the next screen
                },
                child: Text(
                  AppString.skip,
                  style: getSemiBold(
                    color: ColorManager.primary,
                    fontSize: AppSize.s16,
                  ),
                ),
              ),
              _getBottomSheet(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getBottomSheet() {
    // bottom sheet builder
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left arrow
          Padding(
            padding: EdgeInsets.all(AppPadding.p8),
            child: SizedBox(
              height: AppSize.s28,
              width: AppSize.s28,
              child: GestureDetector(
                child: SvgPicture.asset(ImageAssets.leftArrow),
                onTap: () {
                  // go to previous slide
                  _pageController.animateToPage(
                    _currentPageIndex - 1,
                    duration: Duration(
                      milliseconds: DurationConstant.d300,
                    ),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          ),
          // bottom cicles
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < _list.length; i++)
                Padding(
                  padding: EdgeInsets.all(AppPadding.p8),
                  child: _getBottomSheetCircles(i),
                ),
            ],
          ),
          // right arrow
          Padding(
            padding: EdgeInsets.all(AppPadding.p8),
            child: SizedBox(
              height: AppSize.s28,
              width: AppSize.s28,
              child: GestureDetector(
                onTap: () {
                  // go to next slide
                  _pageController.animateToPage(
                    _currentPageIndex + 1,
                    duration: Duration(
                      milliseconds: DurationConstant.d300,
                    ),
                    curve: Curves.easeInOut,
                  );
                },
                child: SvgPicture.asset(ImageAssets.rightArrow),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getBottomSheetCircles(int index) {
    if (index == _currentPageIndex) {
      return SvgPicture.asset(ImageAssets.solidCircle);
    } else {
      return SvgPicture.asset(ImageAssets.hollowCircle);
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key, required this.sliderObject});

  final SliderObject sliderObject;

  @override
  Widget build(BuildContext context) {
    // slider page
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: AppSize.s60),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            // slider page title
            sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            // slider page subtitle
            sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        SizedBox(height: AppSize.s60),
        // slider page image
        SvgPicture.asset(sliderObject.image),
      ],
    );
  }
}

class SliderObject {
  String title;
  String subtitle;
  String image;
  SliderObject(this.title, this.subtitle, this.image);
}
