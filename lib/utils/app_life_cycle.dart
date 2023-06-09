import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:random_video_call_app/utils/ad_manager.dart';

class AppLifecycleReactor {

  AdManager adManager = Get.put(AdManager());

  void listenToAppStateChanges() {
    AppStateEventNotifier.startListening();
    AppStateEventNotifier.appStateStream
        .forEach((state) => _onAppStateChanged(state));
  }

  void _onAppStateChanged(AppState appState) {
    print('New AppState state: $appState');
    if (appState == AppState.foreground) {
      adManager.loadGoogleOpenAd();
    }
  }
}