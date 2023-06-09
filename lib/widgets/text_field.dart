import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:random_video_call_app/utils/utils.dart';

class MyTextField extends StatelessWidget {
  final String hint;
  final double? maxHeight;
  final int? maxLines;
  final int? maxLength;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final Widget? prefix, suffix;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final GestureTapCallback? onTap;
  final bool? isObs;
  final bool? autofocus;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;

  const MyTextField({
    Key? key,
    required this.hint,
    this.maxHeight,
    this.maxLines = 1,
    this.controller,
    this.onSubmitted,
    this.validator,
    this.prefix,
    this.textInputAction,
    this.suffix,
    this.maxLength,
    this.isObs = false,
    this.keyboardType,
    this.inputFormatters,
    this.readOnly,
    this.onTap,
    this.autofocus,
    this.focusNode,
    this.onChanged,
  }) : super(key: key);

  static final OutlineInputBorder _border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide.none);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: isObs!,
        validator: validator,
        maxLength: maxLength,
        keyboardType: keyboardType,
        onFieldSubmitted: onSubmitted,
        controller: controller,
        textInputAction: textInputAction,
        inputFormatters: inputFormatters,
        readOnly: readOnly ?? false,
        maxLines: maxLines,
        onTap: onTap,
        autofocus: autofocus ?? false,
        focusNode: focusNode,
        onChanged: onChanged,
        decoration: InputDecoration(
            counterText: "",
            prefixIcon: prefix,
            suffixIcon: suffix,
            fillColor: const Color(0xffFFFFFF),
            filled: true,
            hintMaxLines: maxLines,
            contentPadding:
                const EdgeInsets.only(right: 10, top: 15, left: 15, bottom: 15),
            hintText: hint,
            border: _border.copyWith(
                borderSide: BorderSide(
                    color: ColorUtil.primaryColor.withOpacity(0.5), width: 1)),
            hintStyle: FontStyleUtilities.h6(
                height: 1.53, fontColor: const Color(0xffABABAB)),
            errorBorder: _border.copyWith(
                borderSide:
                    const BorderSide(color: ColorUtil.redColor, width: 1)),
            enabledBorder: _border.copyWith(
                borderSide: BorderSide(
                    color: ColorUtil.primaryColor.withOpacity(0.5), width: 1)),
            // constraints: ,
            focusedBorder: _border.copyWith(
                borderSide: const BorderSide(
                    color: ColorUtil.primaryColor, width: 1))));
  }
}
