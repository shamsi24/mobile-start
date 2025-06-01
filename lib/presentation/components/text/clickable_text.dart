import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rht_mobile_template/presentation/router/navigation.dart';
import 'package:rht_mobile_template/presentation/shared/shared.dart';

class ClickableText extends StatelessWidget {
  final RouteName? routeName;
  final VoidCallback? onTap;
  final String title;

  const ClickableText({
    super.key,
    this.routeName,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Navigation.push(routeName ?? RouteName.none),
      child: Label(
        text: title,
        color: UIColor.primary,
        size: 12.sp,
        weight: FontWeight.w400,
      ),
    );
  }
}
