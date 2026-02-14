import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:{{name.snakeCase}}/presentation/shared/shared.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            "Img.notFound",
            height: 110.h,
          ),
          24.vertical,
          const Label(
            align: TextAlign.center,
            color: UIColor.darkGrey,
            text:
                "Heçbir məlumat tapılmadı\nZəhmət olmasa mülklərinizə aid məlumatların sistemə əlavə olunması üçün məsul ofisə yaxınlaşın!",
          ),
        ],
      ),
    );
  }
}
