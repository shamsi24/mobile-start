import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsi_mobile_template/presentation/shared/shared.dart';

class PrimaryButton extends StatelessWidget {
  final bool isEnabled;
  final String title;
  final Widget? icon;
  final VoidCallback? onTap;
  final bool hasBorder;
  final Color? textColor;
  final double? radius;
  final Color? backgroundColor;
  final FontWeight? fontWeight;
  final bool isLoading;
  final TextDecoration? textDecoration;

  const PrimaryButton({
    super.key,
    required this.title,
    this.isEnabled = true,
    this.onTap,
    this.icon,
    this.isLoading = false,
    this.hasBorder = false,
    this.textColor,
    this.fontWeight,
    this.textDecoration,
    this.radius,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isLoading,
      child: SizedBox(
        height: 40.h,
        width: hasBorder ? 100.w : null,
        child: Opacity(
          opacity: isEnabled ? 1 : 0.4,
          child: ElevatedButton(
            onPressed: onTap == null
                ? null
                : () {
                    HapticFeedback.lightImpact();
                    onTap?.call();
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ??
                  (hasBorder ? UIColor.clear : UIColor.primary),
              foregroundColor: UIColor.white,
              padding: EdgeInsets.zero,
              elevation: 0,
              shadowColor: UIColor.clear,
              textStyle: TextStyle(fontSize: 16.sp),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(radius ?? 12),
                ),
              ),
            ),
            child: Ink(
              decoration: BoxDecoration(
                color: hasBorder
                    ? (onTap == null ? UIColor.white.withOpacity(0.5) : null)
                    : null,
                border: null,
                borderRadius: BorderRadius.circular(radius ?? 12.0),
              ),
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null)
                      IconButton(
                        onPressed: onTap,
                        icon: icon ?? const SizedBox.shrink(),
                      )
                    else
                      !isLoading
                          ? Label(
                              decoration: textDecoration ?? TextDecoration.none,
                              text: title,
                              color:
                                  !hasBorder ? UIColor.white : UIColor.primary,
                              weight: fontWeight ?? FontWeight.bold,
                              size: 15.sp,
                            )
                          : Center(
                              child: SizedBox(
                                height: 24.sp,
                                width: 24.sp,
                                child: const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      UIColor.white),
                                ),
                              ),
                            ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
