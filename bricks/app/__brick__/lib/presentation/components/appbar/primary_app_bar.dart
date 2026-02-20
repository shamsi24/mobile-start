import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:{{name.snakeCase()}}/presentation/router/navigation.dart';
import 'package:{{name.snakeCase()}}/presentation/shared/shared.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isLeading;
  final String? titleText;
  final FileImage? newImageFile;
  final Widget? leading;
  final Widget? title;
  final List<Widget>? trailing;
  final VoidCallback? onTap;
  final bool? centerTitle;

  final String? subtitle;
  final BuildContext context;

  const PrimaryAppBar(
    this.context, {
    super.key,
    this.subtitle,
    this.titleText,
    this.onTap,
    this.isLeading = true,
    this.newImageFile,
    this.trailing,
    this.leading,
    this.title,
    this.centerTitle,
  });

  @override
  Size get preferredSize => Size.fromHeight(Platform.isIOS ? 55.h : 70.h);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(24),
        bottomRight: Radius.circular(24),
      ),
      child: AppBar(
        leadingWidth: Platform.isIOS ? 80.w : 70.w,
        titleSpacing: leading != null ? 0 : null,
        toolbarHeight: Platform.isAndroid ? 100.h : 50.h,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        automaticallyImplyLeading: false,
        leading: leading ??
            (isLeading
                ? IconButton(
                    onPressed: () => Navigation.pop(),
                    icon: Icon(
                      CupertinoIcons.left_chevron,
                      color: UIColor.white,
                      size: 24.sp,
                    ),
                  )
                : null),
        flexibleSpace: const Image(
          image: AssetImage("Img.loginBackground"),
          fit: BoxFit.cover,
        ),
        centerTitle: true,
        title: title ??
            (titleText == null
                ? null
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Label(
                        text: titleText!,
                        color: UIColor.white,
                        size: isLeading ? 18.sp : 24.sp,
                        weight: FontWeight.w500,
                      ),
                      if (subtitle != null) ...[
                        6.vertical,
                        Label(
                          text: subtitle!,
                          color: UIColor.white,
                          size: 12.sp,
                          weight: FontWeight.w200,
                        ),
                      ],
                    ],
                  )),
        actions: trailing,
      ),
    );
  }
}
