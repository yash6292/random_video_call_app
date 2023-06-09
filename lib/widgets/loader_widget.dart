import 'package:flutter/material.dart';
import 'package:random_video_call_app/utils/utils.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenLoader extends StatelessWidget {
  final String? message;

  const ScreenLoader({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(color: ColorUtil.primaryColor)),
    );
  }
}
