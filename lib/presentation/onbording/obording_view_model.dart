import 'dart:async';

import 'package:project_on_clean_architecture/domain/model.dart';
import 'package:project_on_clean_architecture/presentation/base/base_view_model.dart';
import 'package:project_on_clean_architecture/presentation/resourcses/assets_manager.dart';
import 'package:project_on_clean_architecture/presentation/resourcses/string_manager.dart';

// ViewModel for the Onboarding Screen
// extends BaseViewModel → gets shared start() and dispose()
// implements ObordingViewModelInput → must implement all input methods (user actions)
// implements ObordingViewModelOutputs → must implement all output streams (data sent to UI)
class ObordingViewModel extends BaseViewModel
    implements ObordingViewModelInput, ObordingViewModelOutputs {
  // StreamController is the PIPE
  // SliderViewObject is the data that flows through the pipe
  // sink   → input  end of pipe (we push data in from here)
  // stream → output end of pipe (view listens from here)
  final StreamController<SliderViewObject> _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentPageIndex = 0;

  // called when the screen is closed — always close the pipe to avoid memory leaks
  @override
  void dispose() {
    _streamController.close();
  }

  // called when the screen first opens — push first slide data to view
  @override
  void start() {
    _list = _getListData();
    postDataToStream();
  }

  // called when right arrow is tapped — increment index and push new slide data
  @override
  int goToNextPage() {
    _currentPageIndex++;
    postDataToStream();
    return _currentPageIndex;
  }

  // called when left arrow is tapped — decrement index and push new slide data
  @override
  int goToPreviousSPage() {
    _currentPageIndex--;
    postDataToStream();
    return _currentPageIndex;
  }

  // called when user swipes the page — update current index and push new slide data
  @override
  void onPageChanged(int index) {
    _currentPageIndex = index;
    postDataToStream();
  }

  // called when skip button is tapped — navigate to login screen
  @override
  void onSkip() {
    // TODO: navigate to login screen
  }

  // returns the SINK (input end of pipe)
  // this is how we PUSH SliderViewObject data into the stream
  @override
  Sink<SliderViewObject> get inputOfSliderViewObject => _streamController.sink;

  // returns the STREAM (output end of pipe)
  // this is what the VIEW listens to for new SliderViewObject data
  @override
  Stream<SliderViewObject> get outputOfSliderViewObject =>
      _streamController.stream.map((sliderObject) => sliderObject);

  // Private Functions

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

  void postDataToStream() {
    _streamController.add(
      SliderViewObject(
        sliderObject: _list[_currentPageIndex],
        numberOfPages: _list.length,
        currentPageIndex: _currentPageIndex,
      ),
    );
  }
}

// defines what ACTIONS the user can do on the onboarding screen
// every input method here MUST be implemented in ObordingViewModel
abstract class ObordingViewModelInput {
  void goToNextPage(); // right arrow tapped
  void goToPreviousSPage(); // left arrow tapped
  void onPageChanged(int index); // page swiped
  void onSkip(); // skip button tapped

  // sink is here because PUSHING data is an INPUT action
  Sink<SliderViewObject> get inputOfSliderViewObject;
}

// defines what DATA the view will receive and display
// every output stream here MUST be implemented in ObordingViewModel
abstract class ObordingViewModelOutputs {
  // stream is here because RECEIVING data is an OUTPUT action
  // view will use StreamBuilder to listen to this stream
  Stream<SliderViewObject> get outputOfSliderViewObject;
}

// this is the data object that travels through the stream pipe
// contains everything the view needs to display one slide
class SliderViewObject {
  final SliderObject sliderObject; // title, subtitle, image of current slide
  final int numberOfPages; // total number of slides (for dots indicator)
  final int
  currentPageIndex; // current slide index (for highlighting current dot)

  const SliderViewObject({
    required this.sliderObject,
    required this.numberOfPages,
    required this.currentPageIndex,
  });
}
