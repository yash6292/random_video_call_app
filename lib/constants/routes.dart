import 'package:flutter/material.dart';
import 'package:random_video_call_app/screens/age/age_selection.dart';
import 'package:random_video_call_app/screens/category/category.dart';
import 'package:random_video_call_app/screens/country/country_select_page.dart';
import 'package:random_video_call_app/screens/gender/gender.dart';
import 'package:random_video_call_app/screens/connect_friends/connect_friends.dart';
import 'package:random_video_call_app/screens/user_name/user_name.dart';
import 'package:random_video_call_app/screens/splash/splash.dart';
import 'package:random_video_call_app/screens/video_play/random_video_play.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.route: (context) => const SplashScreen(),
  UserName.route: (context) => const UserName(),
  GenderSelect.route: (context) => const GenderSelect(),
  CountrySelectPage.route: (context) => const CountrySelectPage(),
  AgeSelection.route: (context) => const AgeSelection(),
  CategoryPage.route: (context) => const CategoryPage(),
  RandomVideoPlayPage.route: (context) => const RandomVideoPlayPage(),
  ConnectFriendsScreen.route: (context) => const ConnectFriendsScreen(),
};
