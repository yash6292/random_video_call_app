import 'package:flutter/material.dart';

class AppGradients {
  static final LinearGradient blueGradient = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        const Color(0xff021275),
        const Color(0xff1545c2).withOpacity(0.91)
      ]);
  static final LinearGradient lightBlueGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xff22BEB8),
        const Color(0xff22BEB8).withOpacity(.81)
      ]);
  static const LinearGradient purpleGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xff1E59F0), Color(0xff4676F0)]);
}
