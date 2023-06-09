import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:random_video_call_app/screens/age/age_selection.dart';
import 'package:random_video_call_app/screens/category/category.dart';
import 'package:random_video_call_app/screens/country/country_select_page.dart';
import 'package:random_video_call_app/screens/gender/gender.dart';
import 'package:random_video_call_app/screens/connect_friends/connect_friends.dart';
import 'package:random_video_call_app/screens/user_name/user_name.dart';
import 'package:random_video_call_app/screens/splash/splash.dart';
import 'package:random_video_call_app/screens/video_play/random_video_play.dart';

final List<GetPage> getPages = [
  getPageAnimationR2L(name: SplashScreen.route, page: const SplashScreen()),
  getPageAnimationR2L(name: UserName.route, page: const UserName()),
  getPageAnimationR2L(name: GenderSelect.route, page: const GenderSelect()),
  getPageAnimationR2L(name: CountrySelectPage.route, page: const CountrySelectPage()),
  getPageAnimationR2L(name: AgeSelection.route, page: const AgeSelection()),
  getPageAnimationR2L(name: RandomVideoPlayPage.route, page: const RandomVideoPlayPage()),
  getPageAnimationR2L(name: ConnectFriendsScreen.route, page:  const ConnectFriendsScreen()),
  getPageAnimationR2L(name: CategoryPage.route, page:  const CategoryPage()),
];

GetPage getPageAnimationR2L({required String name, required Widget page}) {
  return GetPage(
      name: name, page: () => page, transition: Transition.rightToLeft);
}
