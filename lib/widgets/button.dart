import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:random_video_call_app/Constants/gradients.dart';
import 'package:random_video_call_app/Utils/font_style.dart';
import 'package:random_video_call_app/utils/color_utils.dart';

class Button extends StatelessWidget {
  const Button(
      {Key? key,
      this.onTap,
      this.color,
      this.isBusy = false,
      this.isDisable = false,
      this.textColor,
      this.height,
      this.style,
      this.isArrowButton = true,
      this.leading,
      this.trailing,
      this.padding,
      this.elevation,
      this.width,
      this.border,
      required this.title})
      : super(key: key);

  final Widget? leading, trailing;
  final String title;
  final Function()? onTap;
  final Color? color, textColor;
  final EdgeInsetsGeometry? padding;
  final bool? isBusy, isDisable, isArrowButton;
  final double? height, elevation, width;
  final TextStyle? style;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(99.r),
      elevation: elevation ?? 3,
      child: Container(
        height: height ?? 48.48.h,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          gradient: color != null
              ? LinearGradient(colors: [color!, color!])
              : AppGradients.blueGradient,
          // color: ColorUtil.primaryColor,
          borderRadius: BorderRadius.circular(99.r),
        ),
        child: InkWell(
            highlightColor: Colors.transparent,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            onTap: isDisable! ? () {} : onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leading ??
                    const Icon(Icons.keyboard_tab_outlined,
                        color: ColorUtil.whiteColor),
                const SizedBox(width: 15),
                Text(
                  title,
                  style: style ??
                      FontStyleUtilities.h5(
                              height: 1,
                              fontColor: textColor ?? ColorUtil.whiteColor)
                          .copyWith(fontSize: 18),
                ),
                const SizedBox(width: 30),
              ],
            )),
      ),
    );
  }
}

bool isAnimating = true;

//enum to declare 3 state of button
enum ButtonState { init, submitting, completed }
