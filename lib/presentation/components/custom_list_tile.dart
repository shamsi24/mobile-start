import 'package:flutter/material.dart';
import 'package:shamsi_mobile_template/presentation/shared/size.dart';

class CustomListTile extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final Widget? trailingSubtitle;

  const CustomListTile(
      {super.key,
      this.leading,
      this.title,
      this.subtitle,
      this.trailing,
      this.trailingSubtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (leading != null) leading ?? const SizedBox.shrink(),
        15.horizontal,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              6.vertical,
              title ?? const SizedBox.shrink(),
            ],
            if (subtitle != null) ...[
              4.vertical,
              subtitle ?? const SizedBox.shrink(),
            ],
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (trailing != null) trailing ?? const SizedBox.shrink(),
            if (trailingSubtitle != null)
              trailingSubtitle ?? const SizedBox.shrink(),
          ],
        )
      ],
    );
  }
}
