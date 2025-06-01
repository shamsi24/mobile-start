import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rht_mobile_template/presentation/shared/shared.dart';

class Label extends StatelessWidget {
  final String? text;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final TextAlign? align;
  final TextDecoration? decoration;
  final String? fontFamily;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontStyle? fontStyle;
  final double? latterSpacing;

  const Label({
    super.key,
    this.text,
    this.maxLines,
    this.overflow,
    this.size,
    this.weight,
    this.color,
    this.align,
    this.decoration,
    this.fontFamily,
    this.latterSpacing,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: size ?? 14.sp,
        fontFamily: fontFamily,
        fontWeight: weight ?? FontWeight.normal,
        color: color ?? UIColor.black,
        letterSpacing: latterSpacing ?? 0.3,
        decoration: decoration,
        fontStyle: fontStyle ?? FontStyle.normal,
      ),
    );
  }
}
