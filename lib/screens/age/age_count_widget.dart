import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:random_video_call_app/utils/utils.dart';

class AgeCount extends StatelessWidget {
  int age;
  int selected;

  AgeCount({Key? key, required this.age, required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 60,
        decoration: BoxDecoration(
            border: selected == age
                ? Border.all(color: ColorUtil.primaryColor,width: 2.w)
                : const Border(),
            shape: BoxShape.circle),
        child: Center(
          child: Text(
           "$age",
            style: FontStyleUtilities.h3(
                fontColor: selected == age
                    ? ColorUtil.blackColor
                    : ColorUtil.greyColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),

    );
  }
}

