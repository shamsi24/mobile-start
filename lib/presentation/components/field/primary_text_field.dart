import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsi_mobile_template/presentation/shared/shared.dart';

class PrimaryTextField extends StatelessWidget {
  final Function(String)? onTextChanged;
  final bool autoFocus;
  final bool? isEditable;
  final String? headText;
  final String? error;
  final bool readOnly;
  final bool? isObscure;
  final Color? backgroundColor;
  final VoidCallback? onTapSuffix;
  final String? initialValue;
  final String? prefixText;
  final TextInputAction? inputAction;
  final Function(String?)? onSubmit;
  final VoidCallback? onTap;
  final Color? fillColor;

  final bool filled;
  final bool hasError;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final Widget? suffix;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool hasBorder;
  final int? minLength;
  final int? maxLine;
  final int? minLine;
  final List<TextInputFormatter>? inputFormatters;
  final double? textSize;
  final FocusNode? focusNode;
  final FontWeight? fontWeight;
  final Widget? prefix;
  final bool? expands;

  const PrimaryTextField({
    super.key,
    this.onTextChanged,
    this.textSize,
    this.backgroundColor,
    this.hasBorder = false,
    this.suffix,
    this.autoFocus = false,
    this.isObscure,
    this.isEditable,
    this.hasError = false,
    this.error,
    this.initialValue,
    this.inputAction,
    this.onSubmit,
    this.onTapSuffix,
    this.headText,
    this.onTap,
    this.prefixText,
    this.focusNode,
    this.fontWeight = FontWeight.w400,
    this.controller,
    this.readOnly = false,
    this.filled = true,
    this.fillColor,
    this.keyboardType,
    this.maxLength,
    this.hintText,
    this.prefix,
    this.minLength,
    this.minLine,
    this.maxLine,
    this.inputFormatters,
    this.hintStyle,
    this.expands,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (headText != null) ...[
          Label(
            text: headText,
            size: 12.sp,
            color: UIColor.darkGrey,
          ),
          8.vertical,
        ],
        TextFormField(
          expands: expands ?? false,
          obscureText: isObscure ?? false,
          onChanged: onTextChanged,
          focusNode: focusNode,
          autofocus: autoFocus,
          inputFormatters: inputFormatters,
          enabled: isEditable,
          initialValue: initialValue,
          textInputAction: inputAction ?? TextInputAction.next,
          onFieldSubmitted: onSubmit,
          onTap: onTap,
          textAlignVertical: TextAlignVertical.center,
          readOnly: readOnly,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: fontWeight ?? FontWeight.w400,
          ),
          controller: controller,
          keyboardType: keyboardType,
          minLines: minLine,
          maxLength: maxLength,
          maxLines: maxLine ?? 1,
          buildCounter: (context,
              {required currentLength, required isFocused, maxLength}) {
            return maxLength != null
                ? Container(
                    transform: Matrix4.translationValues(2, -30, 0),
                    child: Label(
                      text: "$currentLength/$maxLength",
                      size: 12.sp,
                      color: UIColor.black.withOpacity(0.6),
                    ),
                  )
                : null;
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16),
            prefixIcon: prefix,
            hintText: hintText,
            prefixStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: fontWeight ?? FontWeight.w400,
            ),
            prefixText: prefixText,
            hintStyle: hintStyle ??
                TextStyle(
                  color: UIColor.black.withOpacity(0.4),
                  fontSize: 14.sp,
                ),
            fillColor: backgroundColor ?? UIColor.white,
            filled: filled,
            isDense: true,
            errorText: error,
            prefixIconConstraints: const BoxConstraints(),
            suffixIconConstraints: const BoxConstraints(),
            suffixIcon: suffix != null
                ? GestureDetector(
                    onTap: onTapSuffix,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: suffix,
                    ),
                  )
                : null,
            border: !hasBorder ? borderWith() : borderRadius(),
            errorBorder: borderWith(color: UIColor.red),
            focusedErrorBorder: borderWith(color: UIColor.red),
            errorStyle: const TextStyle(color: UIColor.red),
            disabledBorder: !hasBorder ? borderWith() : borderRadius(),
            enabledBorder: !hasBorder ? borderWith() : borderRadius(),
            focusedBorder: !hasBorder
                ? borderWith(color: UIColor.primary)
                : borderRadius(),
          ),
        ),
        if (headText != null) 16.vertical,
      ],
    );
  }

  borderWith({Color? color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: (color ?? UIColor.grey.withOpacity(0.4)),
        width: error != null ? 1 : 1,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(12),
      ),
    );
  }

  borderRadius() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: UIColor.clear),
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
    );
  }
}
