// BASE VIEWMODEL
// every screen's viewmodel will extend this class
// extends BaseViewModelInput  → inherits start() and dispose() as required methods
// implements BaseViewModelOutput → must implement any shared output streams added later
abstract class BaseViewModel extends BaseViewModelInput
    implements BaseViewModelOutput {
  // shared variables and methods that every screen's viewmodel will have
  // for example: loading state, error handling, navigation — added later
}

// BASE INPUT
// defines the MINIMUM actions every screen must support
// every viewmodel in the app will have these two methods
abstract class BaseViewModelInput {
  // called when the screen first opens
  // use it to fetch data, initialize streams, set up the screen
  void start();

  // called when the screen is closed
  // use it to close streams and free memory to avoid memory leaks
  void dispose();
}

// BASE OUTPUT
// defines the MINIMUM streams every screen must expose to the view
// empty for now but will have shared streams later
// for example: loading stream, error stream — added later
abstract class BaseViewModelOutput {
  // shared output streams will be added here later
  // for example:
  // Stream<bool> get outputIsLoading;
  // Stream<String> get outputErrorMessage;
}
