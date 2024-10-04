import 'package:todo_list/core/utils/colors.dart';
import 'package:todo_list/core/utils/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidgets extends StatelessWidget {
  const TextFieldWidgets({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    this.obsecureText = false,
  });

  final TextEditingController controller;
  final String hintText;
  final Function(String) onChanged;
  final bool obsecureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.h),
        border: Border.all(
          color: AppColor.borderColor,
          width: 1,
        ),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration.collapsed(
          hintText: hintText,
          hintStyle: AppTextStyle.normalText.copyWith(
            color: AppColor.borderColor,
          ),
        ),
        obscureText: obsecureText,
        onChanged: onChanged,
      ),
    );
  }
}
