import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:{{name.snakeCase()}}/presentation/shared/shared.dart';

class PrimaryBottomNavigationBarItem extends StatelessWidget {
  final String icon;
  final double? height;
  final String text;
  final Color? color;
  final double? textSize;
  final bool isActive;
  final int? index;
  const PrimaryBottomNavigationBarItem({
    super.key,
    required this.icon,
    this.height,
    required this.text,
    this.color,
    this.textSize,
    this.isActive = false,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          height: height ?? 20.h,
          curve: Curves.slowMiddle,
          duration: const Duration(milliseconds: 200),
          child: Image.asset(
            icon,
            color: color,
          ),
        ),
        4.vertical,
        Label(
          text: text,
          color: color,
          fontFamily: GoogleFonts.poppins().fontFamily,
          size: textSize ?? 12.sp,
        ),
        6.vertical,
        if (isActive)
          Container(
            height: 3.h,
            width: 43.w,
            decoration: const BoxDecoration(
              color: UIColor.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
              ),
            ),
          ),
      ],
    );
  }
}
