import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CommonTextFormFeild extends StatelessWidget {
  TextEditingController? controller;
  int? maxLines;
  Color? cursorColor;
  TextInputType? keyboardType;
  TextAlign? textAlign;
  String? initialValue;
  String? labelText;
  FocusNode? focusNode;
  List<TextInputFormatter>? inputFormatters;
  String? hintText;
  TextStyle? hintStyle;
  final bool obscureText;
  Widget? suffixIcon;
  EdgeInsets? contentPadding;
  InputBorder? focusedBorder;
  String? Function(dynamic value) validator;
  CommonTextFormFeild({
    super.key,
    this.controller,
    this.maxLines,
    this.keyboardType,
    this.cursorColor,
    this.textAlign,
    this.inputFormatters,
    this.initialValue,
    this.focusNode,
    this.hintText,
    this.hintStyle,
    this.labelText,
    required this.obscureText,
    this.suffixIcon,
    this.focusedBorder,
    required this.validator,
    EdgeInsets? contentPadding,
  });
  final bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      controller: controller,
      focusNode: focusNode,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      initialValue: initialValue,
      //textAlign: widget.textAlign,
      cursorColor: Color(0xff1C6BA4),
      decoration: InputDecoration(
        contentPadding: contentPadding,
        labelText: labelText,
        floatingLabelStyle: TextStyle(color: Color(0xff1C6BA4)),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14.sp),
        border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(35.w),
          borderSide: BorderSide(
            color: Color(0xff1C6BA4),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35.w),
          borderSide: BorderSide(
            color: Color(0xff1C6BA4),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35.w),
          borderSide: BorderSide(
            color: Color(0xff1C6BA4),
          ),
        ),
        enabled: true,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35.w),
          borderSide: BorderSide(color: Color(0xff1C6BA4)),
        ),
        suffixIcon: suffixIcon,
      ),
      validator: validator,
    );
  }
}
