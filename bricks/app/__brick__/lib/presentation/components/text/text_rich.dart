import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:{{name.snakeCase()}}/presentation/shared/shared.dart';

class TextRich extends StatelessWidget {
  final String mainText;
  final String text1;
  final String? text2;
  final Color? primaryColor;
  final double? mainTextSize;
  final double? text2Size;
  final Color? secondaryColor;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  const TextRich({
    super.key,
    this.primaryColor,
    this.secondaryColor,
    required this.mainText,
    required this.text1,
    this.text2,
    this.mainTextSize,
    this.text2Size,
    this.textAlign,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.start,
      text: TextSpan(
        text: mainText,
        style: DefaultTextStyle.of(context).style.copyWith(
              color: primaryColor,
              fontSize: mainTextSize ?? 12.sp,
              fontWeight: fontWeight ?? FontWeight.w700,
            ),
        children: <TextSpan>[
          TextSpan(
            text: text1,
            style: TextStyle(
              color: secondaryColor ?? UIColor.primary,
            ),
          ),
          if (text2 != null)
            TextSpan(
              text: text2 ?? "",
            ),
        ],
      ),
    );
  }
}
