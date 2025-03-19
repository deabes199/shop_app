import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';

class CustomCheckWidget extends StatelessWidget {
  const CustomCheckWidget(
      {super.key, required this.textkey, required this.textValue});
  final String textkey, textValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          textkey,
          style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor),
        ),
        const Spacer(),
        Text(
          textValue,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 17.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
